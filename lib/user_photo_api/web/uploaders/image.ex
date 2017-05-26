defmodule UserPhotoAPI.Image do
  use Arc.Definition
  use Arc.Ecto.Definition

  def __storage, do: Arc.Storage.Local

  @versions [:original]
  @acl :public_read

end
