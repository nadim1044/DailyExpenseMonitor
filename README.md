# Daily Expense Monitor

A Flutter application built using **GetX** and **Clean Architecture**. It helps users track their
daily income and expenses with a clean and scalable code structure.

---

## Project Architecture

This project follows **Clean Architecture** with separation of concerns between layers:

```
lib/
├── data/             # API and database layer
├── domain/           # Business logic and use cases
├── presentation/     # UI and GetX controllers
├── DailyMonitorApp.dart         # Entry point with GetMaterialApp
```

---

## GetX Widget Reference

This project uses [GetX](https://pub.dev/packages/get) for state management, navigation, and
dependency injection. Below are the main GetX widgets every Flutter developer should understand.

Even if all of these aren't used in this project directly, they are listed here for educational
purposes and future extensibility.

### `GetBuilder<T>`

A lightweight widget that rebuilds only when `update()` is called inside the controller.

```dart
class CounterController extends GetxController {
  int count = 0;

  void increment() {
    count++;
    update();
  }
}

GetBuilder<CounterController>
(
init: CounterController(),
builder: (controller) => Text('Count: ${controller.count}'
,
);
```

Use when you need **manual control** over UI rebuilds.

---

### `Obx`

A reactive widget that rebuilds the UI when an `.obs` variable changes.

```dart
class CounterController extends GetxController {
  var count = 0.obs;

  void increment() => count++;
}

final controller = Get.put(CounterController());

Obx
(
() => Text('Count: ${controller.count}
'
)
);
```

Use for **simple and automatic** UI updates from state.

---

### `GetX<T>`

More advanced than `Obx`, includes lifecycle and multiple observable bindings.

```dart
GetX<CounterController>
(
init: CounterController(),
builder: (controller) => Text('Value: ${controller.count}'
)
,
);
```

Use when you need **reactivity + lifecycle hooks**.

---

### `GetView<T>`

A stateless widget that allows controller access via `.controller`.

```dart
class HomeView extends GetView<CounterController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => Text('Count: ${controller.count}')),
    );
  }
}
```

Use for **stateless, clean controller access**.

---

### `GetMaterialApp`

Required for enabling GetX features like routing, dialogs, and DI.

```dart
void main() {
  runApp(GetMaterialApp(
    title: 'Daily Money Monitor',
    home: HomeView(),
  ));
}
```

Enables **GetX ecosystem features**.

---

### Widget Summary

| Widget           | Reactive | Needs `update()` | Use Case                                   |
|------------------|----------|------------------|--------------------------------------------|
| `GetBuilder`     | ❌        | ✅ Yes            | Manual UI rebuilds                         |
| `Obx`            | ✅        | ❌ No             | Simple reactive updates                    |
| `GetX`           | ✅        | ❌ No             | Multiple reactive vars + lifecycle         |
| `GetView`        | ✅        | ❌ No             | Stateless with controller access           |
| `GetMaterialApp` | N/A      | N/A              | Enables GetX navigation, DI, and utilities |

---

> This section is intended to guide developers using GetX and Clean Architecture together for
> scalable app development.

# GetX Controller Creation & Lifecycle Management in Flutter

This guide covers how to create, register, access, and manage GetX controllers in Flutter using best
practices. It includes explanations of `Get.put`, `Get.lazyPut`, `Get.putIfAbsent`, `fenix`,
`Get.find`, and lifecycle behavior.

## Creating Controllers

### 1. `Get.put<T>()`

Immediately creates and registers a controller.

```dart
Get.put
(
TransactionController
(
)
);
```

- Controller is available globally.
- Useful when the controller is needed right away.
- Remains in memory until manually removed or app closes.

---

### 2. `Get.lazyPut<T>()`

Lazily creates the controller when first accessed.

```dart
Get.lazyPut
(
(
)
=>
TransactionController
(
)
);
```

- Helps reduce memory usage.
- Controller is not created until it's needed via `Get.find()`.

---

### 3. `Get.putIfAbsent<T>()`

Creates and registers a controller only if it hasn’t been registered yet.

```dart
Get.putIfAbsent<TransactionController>
(
(
)
=>
TransactionController
(
)
);
```

- Prevents multiple instances of the same controller.
- Safe way to ensure single controller instance.

---

## Using `fenix`

Use `fenix: true` with `lazyPut()` to automatically recreate the controller if it's removed from
memory.

```dart
Get.lazyPut
(
() => TransactionController(), fenix: true);
```

- Controller is re-instantiated on demand after being removed.
- Ideal for large apps where you want to release memory without losing access.

---

## Accessing Controllers

You can retrieve any registered controller using:

```dart

final controller = Get.find<TransactionController>();
```

- Throws an error if the controller is not registered.

---

## Checking If Controller Exists

Use `Get.isRegistered<T>()` to check before creating:

```dart
if (!Get.isRegistered<TransactionController>()) {
Get.put(TransactionController());
}
```

---

## Removing Controllers

You can remove a controller using:

```dart
Get.delete<TransactionController>
();
```

- Frees memory.
- If used with `fenix`, it will be recreated when needed.

---

## Best Practices

- ✅ Use `Get.put()` when the controller is critical and used immediately.
- ✅ Use `Get.lazyPut()` for controllers used later to save memory.
- ✅ Use `fenix: true` to auto-recreate removed controllers on demand.
- ✅ Use `putIfAbsent()` to prevent duplicate instances.
- ✅ Use `Get.find()` to retrieve controllers from anywhere.

---

## Example Setup

```dart
// Register
Get.lazyPut
(
() => TransactionController(), fenix: true);

// Access
final controller = Get.find<TransactionController>();

// Use in UI
Obx(() => Text('Total: ₹${controller.totalAmount}'));
```

---

## Cleanup

```dart
@override
void onClose() {
  // Dispose resources
  super.onClose();
}
```

Use `onClose()` to clean up resources when the controller is removed.

---

Feel free to modify this guide for your specific project structure such as Daily Money Monitor.
