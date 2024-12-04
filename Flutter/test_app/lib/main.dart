import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Este widget es la raíz de tu aplicación.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi API',
      theme: ThemeData(
        // Este es el tema de tu aplicación.
        //
        // PRUEBA ESTO: Intenta ejecutar tu aplicación con "flutter run". Verás
        // que la aplicación tiene una barra de herramientas púrpura. Luego, sin
        // salir de la aplicación, intenta cambiar el seedColor en el esquema de
        // colores de abajo a Colors.green y luego invoca "hot reload" (guarda
        // los cambios o presiona el botón de "hot reload" en un IDE compatible
        // con Flutter, o presiona "r" si usaste la línea de comandos para iniciar la aplicación).
        //
        // Nota que el contador no se reinició a cero; el estado de la aplicación
        // no se pierde durante la recarga. Para reiniciar el estado, usa un reinicio completo (hot restart).
        //
        // Esto también funciona con el código, no solo con los valores: La mayoría de
        // los cambios de código se pueden probar con solo una recarga rápida (hot reload).
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'API Álvaro Página de inicio '),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // Este widget es la página de inicio de tu aplicación. Es stateful (con estado),
  // lo que significa que tiene un objeto de estado (definido abajo) que contiene
  // campos que afectan cómo se ve.

  // Esta clase es la configuración del estado. Contiene los valores (en este
  // caso el título) proporcionados por el padre (en este caso el widget App) y
  // usados por el método build del estado. Los campos en una subclase de Widget
  // siempre están marcados como "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // Esta llamada a setState le dice al framework de Flutter que algo ha
      // cambiado en este estado, lo que hace que se vuelva a ejecutar el método
      // build de abajo para que la pantalla refleje los valores actualizados.
      // Si cambiáramos _counter sin llamar a setState(), entonces el método
      // build no se llamaría de nuevo, y nada parecería ocurrir.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Este método se vuelve a ejecutar cada vez que se llama a setState, por ejemplo,
    // como se hizo en el método _incrementCounter de arriba.
    //
    // El framework de Flutter está optimizado para hacer que volver a ejecutar los
    // métodos build sea rápido, de modo que solo necesitas reconstruir lo que
    // necesita actualizarse en lugar de cambiar instancias individuales de widgets.
    return Scaffold(
      appBar: AppBar(
        // PRUEBA ESTO: Intenta cambiar el color aquí a un color específico
        // (por ejemplo, Colors.amber) y activa una recarga rápida para ver cómo
        // cambia el color de la AppBar mientras los otros colores permanecen iguales.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Aquí tomamos el valor del objeto MyHomePage que fue creado por el
        // método App.build, y lo usamos para establecer el título de la barra de la aplicación.
        title: Text(widget.title),
      ),
      body: Center(
        // Center es un widget de diseño. Toma un único hijo y lo posiciona
        // en el centro del elemento padre.
        child: Column(
          // Column también es un widget de diseño. Toma una lista de hijos y
          // los organiza verticalmente. Por defecto, se ajusta para encajar a
          // sus hijos horizontalmente, e intenta ser tan alto como su elemento padre.
          //
          // Column tiene varias propiedades para controlar cómo se ajusta a sí misma
          // y cómo posiciona a sus hijos. Aquí usamos mainAxisAlignment para
          // centrar los hijos verticalmente; el eje principal aquí es el eje
          // vertical porque Column es vertical (el eje cruzado sería horizontal).
          //
          // PRUEBA ESTO: Invoca "debug painting" (elige la acción "Toggle Debug Paint"
          // en el IDE, o presiona "p" en la consola), para ver el contorno de cada widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Contador',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.displayLarge,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Incrementar',
        child: const Icon(Icons.add),
      ), // Esta coma final hace que el formato automático sea más agradable para los métodos build.
    );
  }
}
