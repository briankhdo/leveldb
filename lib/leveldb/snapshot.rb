module LevelDB

  class Snapshot

    def initialize(db, read_opts)
      @_db = db
      @_read_opts = read_opts
      @_snap = C.create_snapshot(@_db)
    end

    def set!
      C.readoptions_set_snapshot(@_read_opts, @_snap)
    end

    def reset!
      C.readoptions_set_snapshot(@_read_opts, nil)
    end

    def inspect
      "#<LevelDB::Snapshot:#{'0x%x' % object_id}>"
    end
    alias to_s inspect
  end
end
