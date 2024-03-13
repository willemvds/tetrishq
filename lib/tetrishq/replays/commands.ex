defmodule TetrisHQ.Replays.Commands do
  def create_from_file(path) do
    initial_hash_state = :crypto.hash_init(:sha256)

    sha256 =
      File.stream!(path, [], 2048)
      |> Enum.reduce(initial_hash_state, &:crypto.hash_update(&2, &1))
      |> :crypto.hash_final()

    TetrisHQ.Repo.insert(%TetrisHQ.Replay{
      id: sha256,
      uploaded_at: DateTime.utc_now()
    })

    formatted_sha256 = Base.encode16(sha256, case: :lower)

    replays_path = Application.get_env(:TetrisHQ, :replays_path)
    File.cp!(path, Path.join(replays_path, "#{formatted_sha256}"))

    sha256
  end
end
