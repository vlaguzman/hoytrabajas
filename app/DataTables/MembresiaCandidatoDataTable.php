<?php

namespace App\DataTables;

use App\Models\MembresiaCandidato;
use Yajra\Datatables\Services\DataTable;
class MembresiaCandidatoDataTable extends DataTable
{

    /**
     * @return \Illuminate\Http\JsonResponse
     */
    public function ajax()
    {
            return $this->datatables
                ->collection( $this->query() )
                ->editColumn('desde',' {{  date(\'d-m-Y \', strtotime($desde) )  }}')
                ->editColumn('hasta',' {{  date(\'d-m-Y \', strtotime($hasta) )  }}')
                ->addColumn('action', 'membresia_candidatos.datatables_actions')
                ->make(true);
    }

    /**
     * Get the query object to be processed by datatables.
     *
     * @return \Illuminate\Database\Query\Builder|\Illuminate\Database\Eloquent\Builder
     */
    public function query()
    {
        $lista  = MembresiaCandidato::select('membresias_candidatos.id','membresias_candidatos.pagado','membresias_candidatos.desde','membresias_candidatos.hasta',
            'candidatos.nombres','membresias.descripcion as des_mem','membresias_candidatos.created_at' )
                    ->leftJoin('candidatos','membresias_candidatos.candidato_id','=','candidatos.id')
                    ->leftJoin('membresias','membresias_candidatos.membresia_id','=','membresias.id')
                    ->orderBy('membresias_candidatos.created_at', 'desc')->get();
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
          'Membresia' => ['name' => 'des_mem', 'data' => 'des_mem'],
          'Empleado' => ['name' => 'nombres', 'data' => 'nombres'],
          'Desde' => ['name' => 'desde', 'data' => 'desde'],
          'Hasta' => ['name' => 'hasta', 'data' => 'hasta'],
          'Monto' => ['name' => 'pagado', 'data' => 'pagado']
        ];
    }

    /**
     * Get filename for export.
     *
     * @return string
     */
    protected function filename()
    {
        return 'membresiaCandidatos';
    }
}
