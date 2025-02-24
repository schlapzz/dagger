# This file generated by `mix dagger.gen`. Please DO NOT EDIT.
defmodule Dagger.TypeDefKind do
  @moduledoc "Distinguishes the different kinds of TypeDefs."
  @type t() :: :BooleanKind | :IntegerKind | :ListKind | :ObjectKind | :StringKind | :VoidKind
  (
    @doc "A boolean value"
    @spec boolean_kind() :: :BooleanKind
    def boolean_kind() do
      :BooleanKind
    end
  )

  (
    @doc "An integer value"
    @spec integer_kind() :: :IntegerKind
    def integer_kind() do
      :IntegerKind
    end
  )

  (
    @doc "A list of values all having the same type.\n\nAlways paired with a ListTypeDef."
    @spec list_kind() :: :ListKind
    def list_kind() do
      :ListKind
    end
  )

  (
    @doc "A named type defined in the GraphQL schema, with fields and functions.\n\nAlways paired with an ObjectTypeDef."
    @spec object_kind() :: :ObjectKind
    def object_kind() do
      :ObjectKind
    end
  )

  (
    @doc "A string value"
    @spec string_kind() :: :StringKind
    def string_kind() do
      :StringKind
    end
  )

  (
    @doc "A special kind used to signify that no value is returned.\n\nThis is used for functions that have no return value. The outer TypeDef\nspecifying this Kind is always Optional, as the Void is never actually\nrepresented."
    @spec void_kind() :: :VoidKind
    def void_kind() do
      :VoidKind
    end
  )
end
