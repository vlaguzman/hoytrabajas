<?php

namespace App\DataTables;

use App\Models\Usuario;
use Form;
use Yajra\Datatables\Services\DataTable;

class UsuarioDataTable extends DataTable
{

    /**
     * @return \Illuminate\Http\JsonResponse
     */
    public function ajax()
    {
            return $this->datatables
                ->collection( $this->query() )
                ->editColumn('created_at',' {{  date(\'d-m-Y \', strtotime($created_at) )  }}')
                ->addColumn('action', 'usuarios.datatables_actions')
                ->make(true);
    }

    /**
     * Get the query object to be processed by datatables.
     *
     * @return \Illuminate\Database\Query\Builder|\Illuminate\Database\Eloquent\Builder
     */
    public function query()
    {

        $lista  = Usuario::select(array('users.id','users.name','users.email','users.activo','users.url_imagen',
                    'perfiles.descripcion as des_perfil','users.created_at','users.perfil_id' ))
                    ->leftJoin('perfiles','users.perfil_id','=','perfiles.id')
                    ->orderBy('perfil_id', 'desc' )
                    ->orderBy( 'created_at', 'desc')->get();
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
            'Usuario' => ['name' => 'email', 'data' => 'email'],
            'Descripcion' => ['name' => 'name', 'data' => 'name'],
            'Perfil' => ['name' => 'des_perfil', 'data' => 'des_perfil'],
            'Activo' => ['name' => 'activo', 'data' => 'activo'],
            'Registrado' => ['name' => 'created_at', 'data' => 'created_at'],

        ];
    }

    /**
     * Get filename for export.
     *
     * @return string
     */
    protected function filename()
    {
        return 'usuarios';
    }
}
