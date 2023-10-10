# This file generated by `mix dagger.gen`. Please DO NOT EDIT.
defmodule Dagger.Module do
  @moduledoc "Module"
  use Dagger.QueryBuilder
  @type t() :: %__MODULE__{}
  defstruct [:selection, :client]

  (
    @doc "Modules used by this module"
    @spec dependencies(t()) :: {:ok, [Dagger.Module.t()]} | {:error, term()}
    def dependencies(%__MODULE__{} = module) do
      selection = select(module.selection, "dependencies")

      selection =
        select(
          selection,
          "dependencies dependencyConfig description generatedCode id name objects sdk sdkRuntime serve sourceDirectory sourceDirectorySubPath withObject"
        )

      with {:ok, data} <- execute(selection, module.client) do
        Nestru.decode_from_list_of_maps(data, Dagger.Module)
      end
    end
  )

  (
    @doc "The dependencies as configured by the module"
    @spec dependency_config(t()) :: {:ok, [Dagger.String.t()]} | {:error, term()}
    def dependency_config(%__MODULE__{} = module) do
      selection = select(module.selection, "dependencyConfig")
      execute(selection, module.client)
    end
  )

  (
    @doc "The doc string of the module, if any"
    @spec description(t()) :: {:ok, Dagger.String.t() | nil} | {:error, term()}
    def description(%__MODULE__{} = module) do
      selection = select(module.selection, "description")
      execute(selection, module.client)
    end
  )

  (
    @doc "The code generated by the SDK's runtime"
    @spec generated_code(t()) :: Dagger.GeneratedCode.t()
    def generated_code(%__MODULE__{} = module) do
      selection = select(module.selection, "generatedCode")
      %Dagger.GeneratedCode{selection: selection, client: module.client}
    end
  )

  (
    @doc "The ID of the module"
    @spec id(t()) :: {:ok, Dagger.ModuleID.t()} | {:error, term()}
    def id(%__MODULE__{} = module) do
      selection = select(module.selection, "id")
      execute(selection, module.client)
    end
  )

  (
    @doc "The name of the module"
    @spec name(t()) :: {:ok, Dagger.String.t()} | {:error, term()}
    def name(%__MODULE__{} = module) do
      selection = select(module.selection, "name")
      execute(selection, module.client)
    end
  )

  (
    @doc "Objects served by this module"
    @spec objects(t()) :: {:ok, [Dagger.TypeDef.t()] | nil} | {:error, term()}
    def objects(%__MODULE__{} = module) do
      selection = select(module.selection, "objects")
      execute(selection, module.client)
    end
  )

  (
    @doc "The SDK used by this module"
    @spec sdk(t()) :: {:ok, Dagger.String.t()} | {:error, term()}
    def sdk(%__MODULE__{} = module) do
      selection = select(module.selection, "sdk")
      execute(selection, module.client)
    end
  )

  (
    @doc "The SDK runtime module image ref."
    @spec sdk_runtime(t()) :: {:ok, Dagger.String.t()} | {:error, term()}
    def sdk_runtime(%__MODULE__{} = module) do
      selection = select(module.selection, "sdkRuntime")
      execute(selection, module.client)
    end
  )

  (
    @doc "Serve a module's API in the current session.\n    Note: this can only be called once per session.\n    In the future, it could return a stream or service to remove the side effect.\n\n\n\n## Optional Arguments\n\n* `environment` -"
    @spec serve(t(), keyword()) :: {:ok, Dagger.Void.t() | nil} | {:error, term()}
    def serve(%__MODULE__{} = module, optional_args \\ []) do
      selection = select(module.selection, "serve")

      selection =
        if is_nil(optional_args[:environment]) do
          selection
        else
          arg(selection, "environment", optional_args[:environment])
        end

      execute(selection, module.client)
    end
  )

  (
    @doc "The directory containing the module's source code"
    @spec source_directory(t()) :: Dagger.Directory.t()
    def source_directory(%__MODULE__{} = module) do
      selection = select(module.selection, "sourceDirectory")
      %Dagger.Directory{selection: selection, client: module.client}
    end
  )

  (
    @doc "The module's subpath within the source directory"
    @spec source_directory_sub_path(t()) :: {:ok, Dagger.String.t()} | {:error, term()}
    def source_directory_sub_path(%__MODULE__{} = module) do
      selection = select(module.selection, "sourceDirectorySubPath")
      execute(selection, module.client)
    end
  )

  (
    @doc "This module plus the given Object type and associated functions\n\n## Required Arguments\n\n* `object` -"
    @spec with_object(t(), Dagger.TypeDef.t()) :: Dagger.Module.t()
    def with_object(%__MODULE__{} = module, object) do
      selection = select(module.selection, "withObject")
      selection = arg(selection, "object", object)
      %Dagger.Module{selection: selection, client: module.client}
    end
  )
end
