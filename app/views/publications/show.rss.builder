xml << render('shared/pub_common/show', :object => @publication,
              :link_url => publication_path(:only_path => false, :id => @publication.id))
