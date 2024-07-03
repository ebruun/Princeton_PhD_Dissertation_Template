# PrincetonDissertate: is a LaTeX dissertation template built out from the original Dissertate template

## Modified by Edvard Bruun, Civil and Environmental Engineering Department, 2024

## See the Original Dissertate template: https://github.com/suchow/Dissertate?tab=readme-ov-file
The original template was writtent to be multi-purpose and to allow a user to swap styles to different schools. It did not appear to be well-maintained and was clearly cluttered with a lot of unnecessary and potentially outdated packages. I modified the template to make it "Princeton-specific", in addition to updating the formatting to the current Princeton requirements (2024). 

## Getting started
1. In the main.tex file, load the documentclass with School=Princeton. This is just a remnant of the old class when you could swap between schools. Maybe I'll remove it at some point...
2. Keep the main.tex file uncluttered, /input or /include separate chapters as needed. Being able to easily turn chapters on and off will help with loading times once the dissertation file gets large. Keep all secondary files organized in folders: appendices, chapters, figs, frontmatter, bibliography. You can set the path in the main.tex file.
3. Import and modify the settings for your own packages, set user-definitions, renew commands, in the .cls file
4. Create or modify the Princeton-specific front-matter pages in the .sty file
5. Profit...

## Information about include versus input: https://tex.stackexchange.com/questions/246/when-should-i-use-input-vs-include
