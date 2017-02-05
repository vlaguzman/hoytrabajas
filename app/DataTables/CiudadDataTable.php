<?php
namespace App\DataTables;

use App\Models\Ciudad;
use Yajra\Datatables\Services\DataTable;
class CiudadDataTable extends DataTable
{

    /**
     * @return \Illuminate\Http\JsonResponse
     */
    public function ajax()
    {
            return $this->datatables
                ->collection( $this->query() )
                ->addColumn('action', 'ciudads.datatables_actions')
                ->make(true);
    }

    /**
     * Get the query object to be processed by datatables.
     *
     * @return \Illuminate\Database\Query\Builder|\Illuminate\Database\Eloquent\Builder
     */
    public function query()
    {
        $lista  = Ciudad::select(array('ciudades.id','ciudades.descripcion','departamentos.descripcion as des_dep'  ))
                          ->leftJoin('departamentos','ciudades.departamento_id','=','departamentos.id')
                          ->orderBy('descripcion', 'desc')->get();
        return $lista;


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
               'Departamento' => ['name' => 'des_dep', 'data' => 'des_dep'],
               'Ciudad' => ['name' => 'descripcion', 'data' => 'descripcion']

        ];
    }

    /**
     * Get filename for export.
     *
     * @return string
     */
    protected function filename()
    {
        return 'ciudads';
    }
}
