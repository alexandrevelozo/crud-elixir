defmodule Hello.UseersTest do
  use Hello.DataCase

  alias Hello.Useers

  describe "users" do
    alias Hello.Useers.User

    @valid_attrs %{description: "some description", email: "some email", name: "some name"}
    @update_attrs %{description: "some updated description", email: "some updated email", name: "some updated name"}
    @invalid_attrs %{description: nil, email: nil, name: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Useers.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Useers.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Useers.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Useers.create_user(@valid_attrs)
      assert user.description == "some description"
      assert user.email == "some email"
      assert user.name == "some name"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Useers.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, %User{} = user} = Useers.update_user(user, @update_attrs)
      assert user.description == "some updated description"
      assert user.email == "some updated email"
      assert user.name == "some updated name"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Useers.update_user(user, @invalid_attrs)
      assert user == Useers.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Useers.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Useers.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Useers.change_user(user)
    end
  end
end
