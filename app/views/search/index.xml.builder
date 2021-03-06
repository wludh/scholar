xml.instruct!
xml.works do
  @works.each do |w|
    work = Work.find(w['pk_i'])
    xml.work(:type => work.type, :id => work.id) do
      xml.link(:href => "#{work_path(work.id)}.xml")
    end
  end
  if @has_next_page
    @page = @page == 0 ? 1 : @page
    xml.link(:rel => "next", :href => "#{search_url()}?q=#{@query}&format=xml&page=#{@page.to_i+1}")
  end
end
