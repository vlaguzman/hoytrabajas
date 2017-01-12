<?php

namespace App\DataTables;

use App\Models\Empleador;
use Form;
use Yajra\Datatables\Services\DataTable;

class EmpleadorDataTable extends DataTable
{

    /**
     * @return \Illuminate\Http\JsonResponse
     */
    public function ajax()
    {
        return $this->datatables
            ->eloquent($this->query())
            ->addColumn('action', 'empleadors.datatables_actions')
            ->make(true);
    }

    /**
     * Get the query object to be processed by datatables.
     *
     * @return \Illuminate\Database\Query\Builder|\Illuminate\Database\Eloquent\Builder
     */
    public function query()
    {
        $empleadors = Empleador::query();

        return $this->applyScopes($empleadors);
    }

    /**
     * Optional method if you want to use html builder.
     *
     * @return \Yajra\Datatables\Html\Builder
     */
    public function html()
    {
        return $this->builder()
            ->columns($this->getColumns())
            ->addAction(['width' => '10%'])
            ->ajax('')
            ->parameters([
                'dom' => 'Bfrtip',
                'language' => [
                           'url' =>  'http://cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Spanish.json'
                ],
                'scrollX' => false,
                'buttons' => [
                    'print',
                    'reset',
                    'reload',
                    [
                         'extend'  => 'collection',
                         'text'    => '<i class="fa fa-download"></i> Exportar',
                         'buttons' => [
                             'csv',
                             'excel',
                             'pdf',
                         ],
                    ]
                ]
            ]);
    }

    /**
     * Get columns.
     *
     * @return array
     */
    private function getColumns()
    {
        return [
            'contacto' => ['name' => 'contacto', 'data' => 'contacto'],
            'empresa' => ['name' => 'empresa', 'data' => 'empresa'],
            'telefono' => ['name' => 'telefono', 'data' => 'telefono'],
            'correo' => ['name' => 'correo', 'data' => 'correo'],
            'descripcion' => ['name' => 'descripcion', 'data' => 'descripcion'],
            'direccion' => ['name' => 'direccion', 'data' => 'direccion'],
            'ciudad_id' => ['name' => 'ciudad_id', 'data' => 'ciudad_id'],
            'user_id' => ['name' => 'user_id', 'data' => 'user_id']
        ];
    }

    /**
     * Get filename for export.
     *
     * @return string
     */
    protected function filename()
    {
        return 'empleadors';
    }
}
