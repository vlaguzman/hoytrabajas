<?php

namespace App\DataTables;

use App\Models\Candidato;
use Form;
use Yajra\Datatables\Services\DataTable;

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;


class CandidatoDataTable extends DataTable
{

    /**
     * @return \Illuminate\Http\JsonResponse
     */
    public function ajax()
    {
            $tipo_  = Auth::user()->perfil_id;
            if($tipo_==1 ){
              return $this->datatables
                  ->collection( $this->query() )
                  ->editColumn('fnac',' {{  date(\'d-m-Y \', strtotime($fnac) )  }}')
                  ->addColumn('action', 'candidatos.datatables_actions')
                  ->make(true);
            }else{
              return $this->datatables
                  ->collection( $this->query() )
                  ->editColumn('fnac',' {{  date(\'d-m-Y \', strtotime($fnac) )  }}')
                  ->addColumn('action', 'candidatos.datatables_actionsv')
                  ->make(true);
            }
    }

    /**
     * Get the query object to be processed by datatables.
     *
     * @return \Illuminate\Database\Query\Builder|\Illuminate\Database\Eloquent\Builder
     */
    public function query()
    {
      $tipo_  = Auth::user()->perfil_id;
      $lista= "";
      if($tipo_==2 ){
          $lista  = Candidato::select(array('candidatos.id','candidatos.nombres','candidatos.apellidos','candidatos.rate','candidatos.experiencia',
             'candidatos.descripcion','candidatos.fnac','users.url_imagen' ,'ciudades.descripcion as des_ciudad','generos.descripcion as des_genero'   ))
                          ->leftJoin('users','candidatos.user_id','=','users.id')
                          ->leftJoin('ciudades','candidatos.ciudad_id','=','ciudades.id')
                          ->leftJoin('generos','candidatos.genero_id','=','generos.id')
                          ->orderBy('nombres', 'desc')->get();

      }else{
        $lista  = Candidato::select(array('candidatos.id','candidatos.nombres','candidatos.apellidos','candidatos.rate','candidatos.experiencia',
             'candidatos.descripcion','candidatos.fnac','users.url_imagen' ,'ciudades.descripcion as des_ciudad','generos.descripcion as des_genero'   ))
                          ->leftJoin('users','candidatos.user_id','=','users.id')
                          ->leftJoin('ciudades','candidatos.ciudad_id','=','ciudades.id')
                          ->leftJoin('generos','candidatos.genero_id','=','generos.id')
                          ->orderBy('nombres', 'desc')->get();
      }
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
            'Imagen' => ['name' => 'url_imagen', 'data' =>  'url_imagen','width'=>'6%','render'=>' "<img src="+data+" style=\"width:50px;height:50px;\" />"' ] ,
            'nombres' => ['name' => 'nombres', 'data' => 'nombres'],
            'apellidos' => ['name' => 'apellidos', 'data' => 'apellidos'],
            'Nacio' => ['name' => 'fnac', 'data' => 'fnac'],
            'Reseña' => ['name' => 'descripcion', 'data' => 'descripcion'],
            'Experiencia' => ['name' => 'experiencia', 'data' => 'experiencia'],
            'Calificacion' => ['name' => 'rate', 'data' => 'rate'],
            'Genero' => ['name' => 'des_genero', 'data' => 'des_genero'],
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
        return 'candidatos';
    }
}
