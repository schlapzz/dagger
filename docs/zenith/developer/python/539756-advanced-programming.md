---
slug: /zenith/developer/python/539756/advanced-programming
displayed_sidebar: "zenith"
date: "2023-11-06"
---

# Advanced Programming

{@include: ../../partials/_experimental.md}

## Introduction

Once you've understood the basics of writing your own Dagger modules, you're going to inevitably want to learn more and do more. That's where this guide comes in. It shows you some of the more advanced techniques, tips and tricks you will need to supercharge your Dagger module development.

## Requirements

This guide assumes that:

- You have a good understanding of the Dagger Python SDK. If not, refer to the [Python](https://dagger-io.readthedocs.org/) SDK reference.
- You have the Dagger CLI installed. If not, [install Dagger](../../../current/cli/465058-install.md).
- You have Docker installed and running on the host system. If not, [install Docker](https://docs.docker.com/engine/install/).

## Use modules in other modules

Modules can call each other. To add a dependency to your module, you can use `dagger mod install`, as in the following example:

```sh
dagger mod install github.com/shykes/daggerverse/helloWorld@26f8ed9f1748ec8c9345281add850fd392441990
```

This module will be added to your `dagger.json`:

```json
"dependencies": [
  "github.com/shykes/daggerverse/helloWorld@26f8ed9f1748ec8c9345281add850fd392441990"
]
```

You can also use local modules as dependencies. However, they must be stored in a sub-directory of your module. For example:

```sh
dagger mod install ./path/to/module
```

The dependent module will be added to your code-generation routines, so you can access it from your own module's code, as shown below:

```python
@function
async def hello_world() -> str:
    return await dagger.hello_world().message()
}
```

:::tip
Find modules on the [Daggerverse](https://daggerverse.dev).
:::

## Chain modules together

Module functions can return custom objects, which in turn can define new functions. This allows for "chaining" of functions in the same style as the [core Dagger API](https://docs.dagger.io/api/reference).

So long as your object can be JSON-serialized by your SDK, its state will be preserved and passed to the next function in the chain.

Here is an example module using the Python SDK:

```python file=./snippets/advanced-programming/chaining/main.py
```

And here is an example query for this module:

```graphql
{
  helloWorld {
    message
    withName(name: "Monde") {
      withGreeting(greeting: "Bonjour") {
        message
      }
    }
  }
}
```

The result will be:

```json
{
  "helloWorld": {
    "message": "Hello, World!",
    "withName": {
      "withGreeting": {
        "message": "Bonjour, Monde!"
      }
    }
  }
}
```

## Miscellanea

- The module's main functions can be declared as either top-level functions or as methods of a class (decorated with [dagger.mod.object_type](https://dagger-io.readthedocs.io/en/latest/module.html#dagger.mod.object_type)) having the same name as the module (in PascalCase), but not both.

## Conclusion

This guide showed you a few patterns and techniques you can use to improve your Dagger module programming skills.
