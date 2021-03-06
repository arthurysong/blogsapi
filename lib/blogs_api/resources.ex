defmodule BlogsApi.Resources do\
# Why is this called Resources, should be called blogs?
  @moduledoc """
  The Resources context.
  """

  import Ecto.Query, warn: false
  alias BlogsApi.Repo

  alias BlogsApi.Resources.Blog

  @doc """
  Returns the list of blogs.

  ## Examples

      iex> list_blogs()
      [%Blog{}, ...]

  """
  def list_blogs do
    Repo.all(Blog)
  end

  @doc """
  Gets a single blog.

  Raises `Ecto.NoResultsError` if the Blog does not exist.

  ## Examples

      iex> get_blog!(123)
      %Blog{}

      iex> get_blog!(456)
      ** (Ecto.NoResultsError)

  """
  def get_blog!(id), do: Repo.get!(Blog, id)

  def inc_views(id) do
    from(blog in Blog,
      update: [
        inc: [
          views: 1
        ]
      ],
      where: blog.id == ^id
    )
    |> Repo.update_all([])
  end

  def inc_likes(id) do
    from(blog in Blog,
      update: [
        inc: [
          likes: 1
        ]
      ],
      where: blog.id == ^id
    )
    |> Repo.update_all([])
  end

  def dec_likes(id) do
    from(blog in Blog,
      update: [
        inc: [
          likes: -1
        ]
      ],
      where: blog.id == ^id
    )
    |> Repo.update_all([])
  end



  @doc """
  Creates a blog.

  ## Examples

      iex> create_blog(%{field: value})
      {:ok, %Blog{}}

      iex> create_blog(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_blog(attrs \\ %{}) do
    %Blog{}
    |> Blog.changeset(attrs)
    # this takes a changeset ...
    |> Repo.insert()
  end

  @doc """
  Updates a blog.

  ## Examples

      iex> update_blog(blog, %{field: new_value})
      {:ok, %Blog{}}

      iex> update_blog(blog, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_blog(%Blog{} = blog, attrs) do
    blog
    |> Blog.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a blog.

  ## Examples

      iex> delete_blog(blog)
      {:ok, %Blog{}}

      iex> delete_blog(blog)
      {:error, %Ecto.Changeset{}}

  """
  def delete_blog(%Blog{} = blog) do
    Repo.delete(blog)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking blog changes.

  ## Examples

      iex> change_blog(blog)
      %Ecto.Changeset{data: %Blog{}}

  """
  def change_blog(%Blog{} = blog, attrs \\ %{}) do
    Blog.changeset(blog, attrs)
  end
end
