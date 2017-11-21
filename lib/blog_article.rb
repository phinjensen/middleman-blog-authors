module Middleman
  module Blog
    module BlogArticle
      def authors
        author_permalinks.map{|permalink| @app.blog_authors_data[permalink]}
      end

      def author_permalinks
        if data.author
          if data.author.kind_of?(Array)
            authors = data.author
          else
            authors = [data.author]
          end
        else
          authors = data.authors ? data.authors.split(',') : []
        end
        authors.map { |author| Middleman::BlogAuthors::AuthorPages.permalink(author) }
      end

      def author_names
        if data.author
          if data.author.kind_of?(Array)
            data.author
          else
            [data.author]
          end
        else
          data.authors ? data.authors.split(',').map{ |author| author.strip } : []
        end
      end
    end
  end
end
