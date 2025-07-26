# Test Suite - Diagram Viewer

Questa directory contiene tutti i test per il package `diagram_viewer`, organizzati secondo una struttura speculare a quella di `lib`.

## Struttura dei Test

```
test/
├── README.md                           # Questo file
├── test_config.dart                    # Configurazione globale dei test
├── diagram_viewer_test.dart            # Test per DiagramViewer widget
├── diagram_object_entity_test.dart     # Test per DiagramObjectEntity
├── diagram_content_repository_test.dart # Test per DiagramContentRepository
├── integration/                        # Test di integrazione
│   ├── diagram_viewer_integration_test.dart
│   └── bloc_communication_test.dart
├── example/                            # Test specifici per esempio
│   └── example_integration_test.dart
└── presentation/                       # Struttura speculare a lib/presentation
    ├── bloc/
    │   ├── diagram_object/
    │   │   └── diagram_object_bloc_test.dart
    │   └── scrolling/
    │       └── scrolling_bloc_test.dart
    └── widgets/
        └── scrolling_view_test.dart
```

## Come Eseguire i Test dall'IDE

### VS Code / Cursor

1. **Apri la palette dei comandi** (`Cmd+Shift+P` su macOS)
2. **Seleziona "Debug: Start Debugging"** o premi `F5`
3. **Scegli una delle configurazioni di test**:
   - `Run All Tests` - Esegue tutti i test
   - `Run Unit Tests` - Solo test unitari
   - `Run Integration Tests` - Solo test di integrazione
   - `Run Example Tests` - Solo test dell'esempio
   - `Run BLoC Tests` - Solo test dei BLoC
   - `Run Widget Tests` - Solo test dei widget
   - `Run DiagramViewer Tests` - Test specifici per DiagramViewer
   - `Run Entity Tests` - Test per le entità
   - `Run Repository Tests` - Test per il repository

### Test Explorer

1. **Apri il Test Explorer** (icona del foglio con il segno di spunta)
2. **Espandi la struttura dei test**
3. **Clicca su un test specifico** per eseguirlo
4. **Usa i controlli per eseguire gruppi di test**

### Debug di Test Specifici

1. **Apri il file di test** che vuoi debuggare
2. **Metti un breakpoint** nel test
3. **Clicca su "Run Test"** accanto al test specifico
4. **Il debugger si fermerà** al breakpoint

## Esecuzione da Terminale

```bash
# Tutti i test
flutter test

# Test specifici
flutter test test/diagram_viewer_test.dart
flutter test test/integration/
flutter test test/example/

# Test con coverage
flutter test --coverage

# Test con output dettagliato
flutter test --reporter=expanded

# Test con timeout personalizzato
flutter test --timeout=60s
```

## Tipologie di Test

### Unit Tests
- **Posizione**: File nella root di `test/` e `test/presentation/`
- **Scopo**: Testare singole unità di codice
- **Esempi**: BLoC, entità, repository

### Integration Tests
- **Posizione**: `test/integration/`
- **Scopo**: Testare l'interazione tra componenti
- **Esempi**: Comunicazione tra BLoC, flusso completo

### Example Tests
- **Posizione**: `test/example/`
- **Scopo**: Riprodurre scenari dell'app di esempio
- **Esempi**: Problemi specifici, workflow utente

### Widget Tests
- **Posizione**: `test/presentation/widgets/`
- **Scopo**: Testare componenti UI
- **Esempi**: Rendering, interazioni utente

## Configurazione

### Test Config (`test_config.dart`)
Contiene configurazioni globali per i test:
- Timeout predefiniti
- Dimensioni viewport standard
- Oggetti di test predefiniti
- Utility comuni

### VS Code Settings (`.vscode/settings.json`)
Configurazioni per l'esperienza di testing nell'IDE:
- Test runner: `flutter_test`
- Reporter: `expanded`
- Coverage: abilitato
- Test explorer: abilitato

## Debugging

### Problemi Comuni

1. **"program does not exist"**
   - Verifica che il file di test esista
   - Controlla il percorso in `launch.json`

2. **Test che falliscono**
   - Usa `--reporter=expanded` per output dettagliato
   - Aggiungi `print()` per debug
   - Usa breakpoints per ispezionare lo stato

3. **Timeout nei test**
   - Aumenta il timeout con `--timeout=60s`
   - Verifica le operazioni asincrone
   - Usa `await tester.pumpAndSettle()` per widget test

### Best Practices

1. **Organizzazione**: Mantieni la struttura speculare
2. **Naming**: Usa nomi descrittivi per i test
3. **Isolamento**: Ogni test deve essere indipendente
4. **Mocking**: Usa mock consistenti
5. **Coverage**: Mantieni alta copertura dei test

## Comandi Utili

```bash
# Genera coverage report
flutter test --coverage
genhtml coverage/lcov.info -o coverage/html

# Test con watch mode (ri-esegue automaticamente)
flutter test --watch

# Test specifici con pattern
flutter test --name="DiagramViewer"

# Test con verbose output
flutter test --verbose
``` 