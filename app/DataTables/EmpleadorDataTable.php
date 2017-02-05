<?php

namespace App\DataTables;

use App\Models\Empleador;
use Yajra\Datatables\Services\DataTable;
class EmpleadorDataTable extends DataTable
{

    /**
     * @return \Illuminate\Http\JsonResponse
     */
    public function ajax()
    {
            return $this->datatables
                ->collection( $this->query() )
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
        $lista  = Empleador::select('empleadores.id','empleadores.empresa','empleadores.contacto','empleadores.telefono','empleadores.correo',
             'empleadores.descripcion','empleadores.direccion','users.url_imagen' ,'ciudades.descripcion as des_ciudad')
                          ->leftJoin('users','empleadores.user_id','=','users.id')
                          ->leftJoin('ciudades','empleadores.ciudad_id','=','ciudades.id')
                          ->orderBy('empleadores.empresa', 'desc')->get();

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
            'Imagen' => ['name' => 'url_imagen', 'data' =>  'url_imagen','width'=>'6%','render'=>' "<img src="+data+" style=\"width:50px;height:50px;\" />"' ] ,
            'contacto' => ['name' => 'contacto', 'data' => 'contacto'],
            'empresa' => ['name' => 'empresa', 'data' => 'empresa'],
            'telefono' => ['name' => 'telefono', 'data' => 'telefono'],
            'correo' => ['name' => 'correo', 'data' => 'correo'],
            'descripcion' => ['name' => 'descripcion', 'data' => 'descripcion'],
            'direccion' => ['name' => 'direccion', 'data' => 'direccion'],
            'Ciudad' => ['name' => 'des_ciudad', 'data' => 'des_ciudad'],
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
