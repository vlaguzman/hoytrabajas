<?php

namespace App\DataTables;

use App\Models\Administrador;
use Form;
use Yajra\Datatables\Services\DataTable;

class AdministradorDataTable extends DataTable
{

    /**
     * @return \Illuminate\Http\JsonResponse
     */
    public function ajax()
    {
        return $this->datatables
            ->eloquent($this->query())
            ->addColumn('action', 'administradors.datatables_actions')
            ->make(true);
    }

    /**
     * Get the query object to be processed by datatables.
     *
     * @return \Illuminate\Database\Query\Builder|\Illuminate\Database\Eloquent\Builder
     */
    public function query()
    {
        $administradors = Administrador::query();

        return $this->applyScopes($administradors);
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
            'nombres' => ['name' => 'nombres', 'data' => 'nombres'],
            'apellidos' => ['name' => 'apellidos', 'data' => 'apellidos'],
            'telefono' => ['name' => 'telefono', 'data' => 'telefono'],
            'correo' => ['name' => 'correo', 'data' => 'correo'],
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
        return 'administradors';
    }
}
