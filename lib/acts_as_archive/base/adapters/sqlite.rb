module ActsAsArchive
  module Base
    module Adapters
      module SQLite
        private

        def archive_table_indexed_columns
          index_query = "PRAGMA INDEX_LIST('archived_#{table_name}')"
          indexes = connection.select_all(index_query).collect do |r|
            r["name"]
          end
        end
      end
    end
  end
end
