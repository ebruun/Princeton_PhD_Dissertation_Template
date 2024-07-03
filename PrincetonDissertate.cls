% -------------------------------------------------------------------
%  @LaTeX-class-file{
%     filename        = "Dissertate.cls",
%     version         = "1.0",
%     original date   = "24 January 2014", https://github.com/suchow/Dissertate.git
%     modified date   = 03/2024 (Updated by Edvard Bruun for Princeton only)
%     codetable       = "ISO/ASCII",
%     keywords        = "LaTeX, Dissertate",
%     supported       = "send email to  ....,
%     docstring       = "Class for a dissertation."
% --------------------------------------------------------------------

% Based on: https://github.com/suchow/Dissertate.git
% (EB_2024) cleaned up this whole file, organized everything in a legible way

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{PrincetonDissertate}[2024/03/24 for Princeton]
\LoadClass[12pt, oneside, letterpaper]{book}

% ==============================================================
% User-Defined Definitions
% ==============================================================
\def\degreeyear#1{\gdef\@degreeyear{#1}}
\def\degreemonth#1{\gdef\@degreemonth{#1}}
\def\degree#1{\gdef\@degree{#1}}
\def\advisor#1{\gdef\@advisor{#1}}
\def\department#1{\gdef\@department{#1}}
\def\field#1{\gdef\@field{#1}}
\def\university#1{\gdef\@university{#1}}
\def\universitycity#1{\gdef\@universitycity{#1}}
\def\universitystate#1{\gdef\@universitystate{#1}}
\def\programname#1{\gdef\@programname{#1}}
\def\pdOneName#1{\gdef\@pdOneName{#1}}
\def\pdOneSchool#1{\gdef\@pdOneSchool{#1}}
\def\pdOneYear#1{\gdef\@pdOneYear{#1}}
\def\pdTwoName#1{\gdef\@pdTwoName{#1}}
\def\pdTwoSchool#1{\gdef\@pdTwoSchool{#1}}
\def\pdTwoYear#1{\gdef\@pdTwoYear{#1}}

%(EB_2024) new things added
\long\def\abstracttext#1{\gdef\@abstracttext{#1}} %omg, add \long to allow for paragraph breaks in \abstracttext
\long\def\acknowledgmenttext#1{\gdef\@acknowledgmenttext{#1}}
\def\dedicationtext#1{\gdef\@dedicationtext{#1}}


% ==============================================================
% User-Defined Package Uploads
% ==============================================================

%% MISCELLANEOUS PACKAGES
\RequirePackage{kvoptions}          %use options in key-value format for their package options
\RequirePackage{soul}               %provides commands for highlighting text using different methods
\RequirePackage{import}             %allow include graphics from different directions, manage files/directories
\RequirePackage{lineno}             %allow lines numbers
\RequirePackage{lipsum}             %Generates dummy text (Lorem Ipsum) for testing layouts.
\RequirePackage{lettrine}           %Enables dropped capitals (large initial letters) at the beginning of paragraphs
\RequirePackage{pdflscape}          %Enables landscape pages in PDF documents, for large tables
\RequirePackage[
    table,                          %load with table features. 
    dvipsnames]{xcolor}             %load predefined colors from dvipsnames color palette. upgrade from 'color' package. 
\RequirePackage[
    letterpaper,
    left=1.0in,                     %for bound version set to left=1.5in
    right=1in,
    top=1in,
    bottom=1in]{geometry}





%This package usually has to be loaded before a bunch of others
\RequirePackage[
    breaklinks=True,            %doesnt do anything, unless DVI build I think
    colorlinks=True,            %use color for links
    allcolors=blue,             %set all links to this color
    % urlcolor=SchoolColor,       %set all URLs to the color defined in .sty file
    % hidelinks,                  %hide all the hyperlinks in the text (makes them black)
    pdfauthor=EdvardBruun,     %set name in PDF properties
    pdftitle=Bruun\_PhD\_dissertation,        %set the name if file in PDF properties
    ]{hyperref}



%% TEXT AND GENERAL FORMATTING
\RequirePackage{indentfirst}            %Indent first paragraph after section header
\RequirePackage{chapterbib}             %multiple bibliographies in a doc, each chapter its own bib.
\RequirePackage[titles]{tocloft}        %customization options for ToC, LoF, and LoT
\RequirePackage{ragged2e}               %Provides improved commands for justified text alignment in LaTeX.
\RequirePackage{verbatim}               %Improves handling of verbatim text.
\RequirePackage{setspace}               %Adjusts line spacing in the document.
\RequirePackage{fancyhdr}               %Customizes headers and footers in the document.
% \RequirePackage{titlesec}               %Customizes the formatting of section titles
\RequirePackage{titling}                %Provides tools for customizing the title page.
\RequirePackage[palatino]{quotchap}     %Styles chapter headings with decorative quotations using the Palatino font.
\RequirePackage{enumitem}               %customize the appearance and layout of itemized, enumerated, and description lists
\RequirePackage{etoolbox}               %allows custom formatting of LOF, patch commands



%% MATH
% \RequirePackage[tight,nice]{units}      %Facilitates typesetting of physical units
\RequirePackage{siunitx}                %typesetting physical quantities and their units, allows table align based on decimal
\RequirePackage{amsmath}                %additional environments for multiline equations. align, gather etc
\RequirePackage{mathspec}               %Allows the use of custom fonts for math typesetting. load after amsmath
\RequirePackage{amssymb}                %used in math typesetting for wider range of mathematical symbols
\RequirePackage{fontspec}               %allows the user to select fonts in XeLaTeX or LuaLaTeX
\RequirePackage{algorithm}              %for algorithm
\RequirePackage{algpseudocode}          %for pseudo-code


%% CITING, REFERENCING, BIBLIOGRAPHY AND APPENDIX
\RequirePackage[
    numbers,                            %change to "authoryear" if want to do author names in line with text rather than nums
    comma,                              %character between multiple references
    sectionbib,                         %bibliography is treated as part of the section it is included in, not separate entity
    sort&compress                       %sort citation numbers, compress consecutive numbers
    ]{natbib}              
\RequirePackage[titletoc]{appendix}     %titletoc = add APPENDIX before each entry in TOC
\RequirePackage[hyphens]{xurl}          %Improves URL handling in doc, allowing line breaks at hyphens in URL
\RequirePackage[nameinlink]{cleveref}   %allows \cref rather than \ref, 'nameinlink' type as part of the link, load after amsmath


%% FIGURES
\RequirePackage{graphicx}
\RequirePackage[
    font={stretch=1.0},
    labelfont={bf,it},          %specifies that the label font for captions
    textfont={it},              %specifies that the text font for captions
    justification={centering},  %aligned to both left and right margins
    singlelinecheck=false,      %want multi-line captions to be justified
    margin=0pt,                 %extend to the left and right edges of the text area
    figurewithin=chapter,       %reset with each new chapter
    tablewithin=chapter         %reset with each new chapter
    ]{caption}
\RequirePackage{subcaption}     %allows you to create subfigures with their own captions and labels
\RequirePackage{float}          %provides additional options for controlling the placement of floats
\RequirePackage{afterpage}      %create float-only page
% \usepackage{floatpag}

%% TABLES
\RequirePackage{tablefootnote}              %Allows adding footnotes to tables in LaTeX documents.
\RequirePackage{booktabs}                   %Enhances the quality of tables by providing better horizontal rule lines
\RequirePackage{makecell}                   %enables line breaks and other formatting options within cells
\RequirePackage{array}                      %enhances the array and tabular environments, more flexible column formatting
\RequirePackage[flushleft]{threeparttable}  %addition of notes to tables, aligns notes to left
\RequirePackage{longtable}                  %tables that can span multiple pages
\RequirePackage{multirow}                   %cells that span multiple rows in a table
\RequirePackage{tabularx}                   %upgrade to tabular, allows automatic column width calculation
\RequirePackage{diagbox}                    %for diagonal line in table
\RequirePackage{multicol}

\makeatletter
    \patchcmd{\@chapter}{\addtocontents{lof}{\protect\addvspace{10\p@}}}{\addtocontents{lof}{\protect\addvspace{100\p@}}}{\typeout{Patching SUCCESS}}{\typeout{Patching FAILED}}
    \patchcmd{\@chapter}{\addtocontents{lot}{\protect\addvspace{10\p@}}}{\addtocontents{lot}{\protect\addvspace{100\p@}}}{\typeout{Patching SUCCESS}}{\typeout{Patching FAILED}}
\makeatother

% ==============================================================
% User-Defined Settings
% ==============================================================
\input{style/BruunSettings}
