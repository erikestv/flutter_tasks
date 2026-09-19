import 'package:flutter/material.dart';

void main() {
  runApp(const MeuApp());
}

String emailCadastrado = '';
String senhaCadastrada = '';

Map<String, List<String>> tarefasPorData = {};

const Color verdeMusgo = Color(0xff556B2F);
const Color fundo = Color(0xffF3F4EF);

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EstvTask',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: fundo,
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final email = TextEditingController();
  final senha = TextEditingController();

  void entrar() {
    if (email.text == emailCadastrado &&
        senha.text == senhaCadastrada &&
        email.text.isNotEmpty &&
        senha.text.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const InicioPage(),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('E-mail ou senha incorretos'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: fundo,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 450),
              child: Column(
                children: [
                  Container(
                    width: 82,
                    height: 82,
                    decoration: BoxDecoration(
                      color: verdeMusgo,
                      borderRadius: BorderRadius.circular(23),
                    ),
                    child: const Icon(
                      Icons.task_alt,
                      size: 50,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 22),
                  const Text(
                    'EstvTask',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: verdeMusgo,
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'Organize suas tarefas',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Column(
                      children: [
                        TextField(
                          controller: email,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            labelText: 'E-mail',
                            prefixIcon: const Icon(Icons.email_outlined),
                            filled: true,
                            fillColor: fundo,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        TextField(
                          controller: senha,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Senha',
                            prefixIcon: const Icon(Icons.lock_outline),
                            filled: true,
                            fillColor: fundo,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: double.infinity,
                          height: 52,
                          child: ElevatedButton(
                            onPressed: entrar,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: verdeMusgo,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                            ),
                            child: const Text(
                              'ENTRAR',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CadastroPage(),
                        ),
                      );
                    },
                    child: const Text(
                      'Criar uma nova conta',
                      style: TextStyle(
                        color: verdeMusgo,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final email = TextEditingController();
  final senha = TextEditingController();

  void cadastrar() {
    if (email.text.isNotEmpty && senha.text.isNotEmpty) {
      emailCadastrado = email.text;
      senhaCadastrada = senha.text;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Cadastro realizado com sucesso'),
        ),
      );

      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Preencha todos os campos'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: fundo,
      appBar: AppBar(
        backgroundColor: verdeMusgo,
        foregroundColor: Colors.white,
        title: const Text('Cadastro'),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 450),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  children: [
                    const Icon(
                      Icons.person_add,
                      size: 65,
                      color: verdeMusgo,
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Criar conta',
                      style: TextStyle(
                        fontSize: 27,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 22),
                    TextField(
                      controller: email,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'E-mail',
                        prefixIcon: const Icon(Icons.email_outlined),
                        filled: true,
                        fillColor: fundo,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: senha,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Senha',
                        prefixIcon: const Icon(Icons.lock_outline),
                        filled: true,
                        fillColor: fundo,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 22),
                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: ElevatedButton(
                        onPressed: cadastrar,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: verdeMusgo,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        child: const Text(
                          'CADASTRAR',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class InicioPage extends StatelessWidget {
  const InicioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: fundo,
      appBar: AppBar(
        backgroundColor: verdeMusgo,
        foregroundColor: Colors.white,
        title: const Text('EstvTask'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Bem Vindo, Erik!',
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'MEU RA: 01',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 25),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  color: verdeMusgo,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.calendar_month,
                      color: Colors.white,
                      size: 42,
                    ),
                    SizedBox(height: 14),
                    Text(
                      'Minhas tarefas',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      'Organize seu dia de forma simples.',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CalendarioPage(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.calendar_today),
                  label: const Text('Abrir calendário'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: verdeMusgo,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CalendarioPage extends StatefulWidget {
  const CalendarioPage({super.key});

  @override
  State<CalendarioPage> createState() => _CalendarioPageState();
}

class _CalendarioPageState extends State<CalendarioPage> {
  DateTime dataEscolhida = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: fundo,
      appBar: AppBar(
        backgroundColor: verdeMusgo,
        foregroundColor: Colors.white,
        title: const Text('Calendário'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: CalendarDatePicker(
                  initialDate: dataEscolhida,
                  firstDate: DateTime(2020),
                  lastDate: DateTime(2030),
                  onDateChanged: (data) {
                    setState(() {
                      dataEscolhida = data;
                    });
                  },
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TarefasPage(
                          data: dataEscolhida,
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: verdeMusgo,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: const Text('Ver tarefas'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TarefasPage extends StatefulWidget {
  final DateTime data;

  const TarefasPage({
    super.key,
    required this.data,
  });

  @override
  State<TarefasPage> createState() => _TarefasPageState();
}

class _TarefasPageState extends State<TarefasPage> {
  String get chaveData =>
      '${widget.data.year}-${widget.data.month}-${widget.data.day}';

  List<String> get tarefas {
    return tarefasPorData[chaveData] ?? [];
  }

  void adicionarTarefa() {
    String tarefa = '';

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Nova tarefa'),
          content: TextField(
            autofocus: true,
            onChanged: (valor) {
              tarefa = valor;
            },
            decoration: const InputDecoration(
              hintText: 'Digite sua tarefa',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                if (tarefa.trim().isNotEmpty) {
                  setState(() {
                    tarefasPorData.putIfAbsent(
                      chaveData,
                      () => [],
                    );

                    tarefasPorData[chaveData]!.add(
                      tarefa.trim(),
                    );
                  });
                }

                Navigator.pop(context);
              },
              child: const Text('Adicionar tarefa'),
            ),
          ],
        );
      },
    );
  }

  void removerTarefa(String tarefa) {
    setState(() {
      tarefasPorData[chaveData]?.remove(tarefa);
    });
  }

  void concluirTarefa(String tarefa) {
    setState(() {
      tarefasPorData[chaveData]?.remove(tarefa);
      tarefasPorData['concluidas_$chaveData'] ??= [];
      tarefasPorData['concluidas_$chaveData']!.add(tarefa);
    });
  }

  void voltarTarefa(String tarefa) {
    setState(() {
      tarefasPorData['concluidas_$chaveData']?.remove(tarefa);
      tarefasPorData.putIfAbsent(
        chaveData,
        () => [],
      );
      tarefasPorData[chaveData]!.add(tarefa);
    });
  }

  @override
  Widget build(BuildContext context) {
    final pendentes = [...tarefas]..sort();
    final concluidas =
        [...(tarefasPorData['concluidas_$chaveData'] ?? [])]..sort();

    final dataFormatada =
        '${widget.data.day.toString().padLeft(2, '0')}/'
        '${widget.data.month.toString().padLeft(2, '0')}/'
        '${widget.data.year}';

    return Scaffold(
      backgroundColor: fundo,
      appBar: AppBar(
        backgroundColor: verdeMusgo,
        foregroundColor: Colors.white,
        title: const Text('Minhas tarefas'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: adicionarTarefa,
        backgroundColor: verdeMusgo,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 90),
          children: [
            const Text(
              'Tarefas do dia',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              dataFormatada,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'EM ANDAMENTO',
              style: TextStyle(
                color: verdeMusgo,
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
            const SizedBox(height: 8),
            if (pendentes.isEmpty)
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Text(
                  'Nenhuma tarefa em andamento.',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ...pendentes.map(
              (tarefa) => Card(
                color: Colors.white,
                elevation: 0,
                margin: const EdgeInsets.only(bottom: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ListTile(
                  leading: Checkbox(
                    value: false,
                    activeColor: verdeMusgo,
                    onChanged: (valor) {
                      if (valor == true) {
                        concluirTarefa(tarefa);
                      }
                    },
                  ),
                  title: Text(tarefa),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete_outline),
                    onPressed: () {
                      removerTarefa(tarefa);
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'CONCLUÍDAS',
              style: TextStyle(
                color: verdeMusgo,
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
            const SizedBox(height: 8),
            if (concluidas.isEmpty)
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Text(
                  'Nenhuma tarefa concluída.',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ...concluidas.map(
              (tarefa) => Card(
                color: Colors.white,
                elevation: 0,
                margin: const EdgeInsets.only(bottom: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ListTile(
                  leading: Checkbox(
                    value: true,
                    activeColor: verdeMusgo,
                    onChanged: (valor) {
                      if (valor == false) {
                        voltarTarefa(tarefa);
                      }
                    },
                  ),
                  title: Text(
                    tarefa,
                    style: const TextStyle(
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete_outline),
                    onPressed: () {
                      setState(() {
                        tarefasPorData['concluidas_$chaveData']
                            ?.remove(tarefa);
                      });
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}