<?php

namespace App\DataTables;

use App\Models\Postulacion;
use Form;
use Yajra\Datatables\Services\DataTable;

class PostulacionDataTable extends DataTable
{

    /**
     * @return \Illuminate\Http\JsonResponse
     */
    public function ajax()
    {
        /*return $this->datatables
            ->eloquent($this->query())
            ->addColumn('action', 'postulacions.datatables_actions')
            ->make(true);*/
            return $this->datatables
                ->collection( $this->query() )
                ->editColumn('fnac',' {{  date(\'d-m-Y \', strtotime($fnac) )  }}')
                ->addColumn('action', 'candidatos.datatables_actions')
                ->make(true);

    }

    /**
     * Get the query object to be processed by datatables.
     *
     * @return \Illuminate\Database\Query\Builder|\Illuminate\Database\Eloquent\Builder
     */
    public function query()
    {
        $lista  = Postulacion::select(array('postulaciones.id','candidatos.id as id2','candidatos.nombres','candidatos.apellidos','candidatos.rate','candidatos.experiencia',
            'candidatos.descripcion','candidatos.fnac','ofertas.url_imagen','users.url_imagen as url_perfil'   ))
                      ->leftJoin('candidatos','postulaciones.candidato_id','=','candidatos.id')
                      ->leftJoin('ofertas','postulaciones.oferta_id','=','ofertas.id')
                      ->join('users', 'candidatos.user_id', '=', 'users.id')
                      ->orderBy('nombres', 'desc')->get();
        return $lista;

      /*  ->leftJoin('users','candidatos.user_id','=','users.id')
        ->leftJoin('ciudades','candidatos.ciudad_id','=','ciudades.id')
        ->leftJoin('generos','candidatos.genero_id','=','generos.id')*/

        /*$postulacions = Postulacion::query();
        return $this->applyScopes($postulacions);*/
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
                'scrollX' => false,
                'language' => [
                           'url' =>  'http://cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Spanish.json'
                ],
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
            /*'oferta_id' => ['name' => 'oferta_id', 'data' => 'oferta_id'],
            'candidato_id' => ['name' => 'candidato_id', 'data' => 'candidato_id'],
            'estatus_id' => ['name' => 'estatus_id', 'data' => 'estatus_id']*/
            'Oferta' => ['name' => 'url_imagen', 'data' =>  'url_imagen','width'=>'6%','render'=>' "<img src="+data+" style=\"width:50px;height:50px;\" />"' ] ,
            'Nombre' => ['name' => 'nombres', 'data' => 'nombres'],
            'Apellido' => ['name' => 'apellidos', 'data' => 'apellidos'],
            'Nacio' => ['name' => 'fnac', 'data' => 'fnac'],
            'Reseña' => ['name' => 'descripcion', 'data' => 'descripcion'],
            'Experiencia' => ['name' => 'experiencia', 'data' => 'experiencia'],
            'Calificacion' => ['name' => 'rate', 'data' => 'rate'],
            'Perfil' => ['name' => 'url_perfil', 'data' =>  'url_perfil','width'=>'6%','render'=>' "<img src="+data+" style=\"width:50px;height:50px;\" />"' ] 



        ];
    }

    /**
     * Get filename for export.
     *
     * @return string
     */
    protected function filename()
    {
        return 'postulacions';
    }
}
