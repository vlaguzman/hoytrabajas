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
                ->collection( $this->query() )
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
          $lista  = Administrador::select('administradores.id','administradores.nombres','administradores.apellidos','administradores.telefono',
                  'administradores.correo','users.url_imagen')
                  ->leftJoin('users','administradores.user_id','=','users.id')
                  ->orderBy('administradores.nombres', 'desc')->get();
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
            'nombres' => ['name' => 'nombres', 'data' => 'nombres'],
            'apellidos' => ['name' => 'apellidos', 'data' => 'apellidos'],
            'telefono' => ['name' => 'telefono', 'data' => 'telefono'],
            'correo' => ['name' => 'correo', 'data' => 'correo']
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
