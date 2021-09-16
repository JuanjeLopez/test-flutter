<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('Dashboard') }}
        </h2>
    </x-slot>
<div class="container">
    @foreach($pedidos as $p)
    <table class="table">
        <thead class="thead-dark">
        <tr>
            <th scope="col">#</th>
            <th scope="col">Productos</th>
            <th scope="col">Precio Total</th>
			<th scope="col">Geolocalización</th>
        </tr>
        </thead>
        <tbody>
            <tr>
                <th scope="row">{{ $p->id }}</th>
                <td>
                    <strong> Nº de artículos: {{ $count = count($p->products) }} </strong>
                    <br>
                    @for($i = 0; $i < $count ; ++$i)
                        {{$p->products[$i]}}<br>
                    @endfor

                </td>
                <td> {{ $p->price }} </td>
				<td> {{ $jloc }} </td>
            </tr>
    </table>
    @endforeach
</div>
