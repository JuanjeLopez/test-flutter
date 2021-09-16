<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('Dashboard') }}
        </h2>
    </x-slot>

    @if ($products->count())
        <table class="table">
            <thead class="thead-dark">
            <tr>
                <th scope="col">#</th>
                <th scope="col">Nombre</th>
                <th scope="col">Descripción</th>
                <th scope="col">Precio</th>
            </tr>
            </thead>
            <tbody>
            @foreach($products as $p)
                <tr>
                    <th scope="row">{{ $p->id }}</th>
                    <td>{{ $p->name }}</td>
                    <td>{{ $p->description }}</td>
                    <td>{{ $p->price }} €</td>
                </tr>
            @endforeach
        </table>
    @else
        <div class="alert alert-info text-center">No hay productos que mostrar</div>
    @endif

    <form action="{{ route('addproduct') }}" method='POST'>
        @csrf
        <div class="form-group">
          <label for="name">Nombre</label>
          <input type="text" class="form-control" name='name' placeholder="Introduce el nombre">
        </div>
        <div class="form-group">
          <label for="description">Descripcion</label>
          <input type="text" class="form-control" name="description" placeholder="Descripción">
        </div>
        <div class="form-group">
            <label for="price">Precio</label>
            <input type="text" class="form-control" name="price" placeholder="Precio en formato 0.00">
          </div>
          <br>
          <button type="submit" class="btn btn-primary">Enviar</button>
      </form>
      <br>
    @if($orders->count())
    <a href='{{ route('orders') }}' class="alert alert-info text-center">
        ACCEDE A LOS PEDIDOS PENDIENTES
    </a>
@else
    <div class="alert alert-info text-center">No hay pedidos pendientes</div>
@endif
</x-app-layout>
