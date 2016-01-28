$jq(function () {
  $jq.each({'#publication_name':'/scholar/publications/autocomplete.json',
        '#publisher_name':'/scholar/publishers/autocomplete.json',
        '#author_name_strings_list input.text':'/scholar/name_strings/autocomplete.json',
        '#contributor_name_strings_list input.text':'/scholar/name_strings/autocomplete.json'},
      function (selector, url) {
        $jq(selector).autocomplete({source:url})
      })
});
