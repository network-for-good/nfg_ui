# Typeface
1. `label:` option.
We run into situations like this on #show views all the time where we are providing a label of the object's attribute (e.g.: "Credit card statement name") followed by the attribute's value.

This requires that users always know the format for setting up the "label" as a %b tag, followed by a BR
```
= ui.nfg :typeface, :body do
  %b Credit card statement name:
  %br
  = entity_presenter.credit_card_statement_name
```

This could become: `= ui.nfg :typeface, label: 'Credit card statement name:', body: entity_presenter.credit_card_statement_name`
That would output the design pattern for the bolded label, break, and body content -- or whatever we may update the pattern to be.

# Icon
1. `:boolean` trait
It is quite common to have a true/false attribute output Yes/No (is a feature turned on or off?) on #show views
This tends to result in something like this:
```
%b The label
%br
= entity.has_link_to_website? ? 'Yes' : 'No'
```
However, the design pattern is actually:
```
- if entity.has_link_to_website?
  = ui.nfg :icon, 'check', :success, text: 'Yes'
- else
  = ui.nfg :icon, 'times', :muted, text: 'No'
```

A `:boolean` trait combined with a `condition:` option might look like this:
`= ui.nfg :icon, :boolean, condition: entity.has_link_to_website?`
Which would then check the condition, if true: output the success themed check icon with "Yes" text, etc.
