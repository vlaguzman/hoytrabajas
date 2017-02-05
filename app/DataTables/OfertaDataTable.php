<?php
namespace App\DataTables;
use App\Models\Oferta;
use App\Models\Empleador;
use Yajra\Datatables\Services\DataTable;
use Illuminate\Support\Facades\Auth;
class OfertaDataTable extends DataTable
{
    /**
     * @return \Illuminate\Http\JsonResponse
     */
    public function ajax()
    {
            return $this->datatables
                ->collection( $this->query() )
                ->editColumn('desde',' {{  date(\'d-m-Y H:i\', strtotime($desde) )     }}')
                ->editColumn('hasta',' {{  date(\'d-m-Y H:i\', strtotime($hasta) )     }}')
                ->addColumn('action', 'ofertas.datatables_actions')
                ->make(true);
    }
    /**
     * Get the query object to be processed by datatables.
     *
     * @return \Illuminate\Database\Query\Builder|\Illuminate\Database\Eloquent\Builder
     */
    public function query()
    {
          $id_usr = Auth::user()->id;
          $tipo_  = Auth::user()->perfil_id;
          $lista= "";
          if( $tipo_==2 ) {
              $prop  = Empleador::where([ ['user_id', '=',$id_usr] ] )->first();
              $lista  = Oferta::select(array('ofertas.id','ofertas.nombre','ofertas.created_at','ofertas.descripcion','ofertas.desde','ofertas.hasta','ofertas.paga','ofertas.sector_id','ofertas.empleador_id','ofertas.url_imagen' ,'empleadores.contacto','sectores.descripcion as des_sector'   ))
                                ->leftJoin('empleadores','ofertas.empleador_id','=','empleadores.id')
                                ->leftJoin('sectores','ofertas.sector_id','=','sectores.id')
                                ->where([ ['empleador_id', '=',$prop->id ] ] )
                                ->orderBy('created_at', 'desc')->get();


          }else{
              $lista  = Oferta::select(array('ofertas.id','ofertas.nombre','ofertas.created_at','ofertas.descripcion','ofertas.desde','ofertas.hasta','ofertas.paga','ofertas.sector_id','ofertas.empleador_id','ofertas.url_imagen' ,'empleadores.contacto','sectores.descripcion as des_sector'   ))
                                ->leftJoin('empleadores','ofertas.empleador_id','=','empleadores.id')
                                ->leftJoin('sectores','ofertas.sector_id','=','sectores.id')
                                ->orderBy('created_at', 'desc')->get();

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
      $tipo_  = Auth::user()->perfil_id;
      if( $tipo_==1 ) {
          return [
              'Imagen' => ['name' => 'url_imagen', 'data' =>  'url_imagen','width'=>'6%','render'=>' "<img src="+data+" style=\"width:50px;height:50px;\" />"'    ] ,
              'Titulo' => ['name' => 'nombre', 'data' => 'nombre'],
              'Descripcion' => ['name' => 'descripcion', 'data' => 'descripcion'],
              'Valor' => ['name' => 'paga', 'data' => 'paga'],
              'Inicia' => ['name' => 'desde', 'data' => 'desde', 'width'=>'10%' ],
              'Finaliza' => ['name' => 'hasta', 'data' => 'hasta', 'width'=>'10%' ],
              'Sector' => ['name' => 'des_sector', 'data' => 'des_sector'],
              'Empleador' => ['name' => 'contacto', 'data' => 'contacto'],
          ];
       }else{
          return [
             'Imagen' => ['name' => 'url_imagen', 'data' =>  'url_imagen','width'=>'6%','render'=>' "<img src="+data+" style=\"width:50px;height:50px;\" />"'    ] ,
             'Titulo' => ['name' => 'nombre', 'data' => 'nombre'],
             'Descripcion' => ['name' => 'descripcion', 'data' => 'descripcion'],
             'Valor' => ['name' => 'paga', 'data' => 'paga'],
             'Inicia' => ['name' => 'desde', 'data' => 'desde', 'width'=>'10%' ],
             'Finaliza' => ['name' => 'hasta', 'data' => 'hasta', 'width'=>'10%' ],
             'Sector' => ['name' => 'des_sector', 'data' => 'des_sector'],
          ];
       }
    }

    /**
     * Get filename for export.
     *
     * @return string
     */
    protected function filename()
    {
        return 'ofertas';
    }
}
