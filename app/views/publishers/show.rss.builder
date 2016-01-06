xml << render('shared/pub_common/show', :object => @publisher,
              :link_url => publisher_path(:only_path => false, :id => @publisher.id))
