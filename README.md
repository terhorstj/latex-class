#  Custom JPT Article Class

Put these files in ```/usr/local/texlive/texmf-local/tex/latex/local``` and run ```sudo mktexlsr```.

* ```jpt.bbx```
* ```jpt.cbx```
* ```jpt.cls```
* ```jpt.sty```

What these files do:

* ```jpt.bbx``` - biblatex style file based on ```biblatex-chem```, lightly modified 
* ```jpt.cbx``` - biblatex style support file based on ```biblatex-chem```, lightly modified 
* ```jpt.cls``` - custom class file based on ```article.cls``` but with some low-level tweaks and global modules
* ```jpt.sty``` - obsolete style file redirecting to ```jpt.cls```

Once you run ```sudo mktexlsr```, TeXLive will add them to your path.

## Usage for Class File

My motivation for making this class file was to simplify setup of a document by grouping commonly used compatible settings into global options.

## Global Options

To invoke the class, use: ```\documentclass{jpt}```

* The class is based on ```article.cls``` and so the typical global options (e.g., ```10pt```, ```titlepage```, etc.) will still work as expected. Some font sizes and spacing have been tweaked, however. (These changes are noted in the class file, which can also be compared to the original ```article.cls```.)

By invoking the class file, you will automatically load the following packages and settings.

* ```\RequirePackage{comment}``` - extremely useful package that I always load
* ```\RequirePackage{microtype}``` - improved typography
* ```\RequirePackage{enumitem}\setlist{noitemsep}``` - get rid of the weird spacing in default itemized/enumerated lists
* ```\RequirePackage[version=4]{mhchem}``` - chemistry package that also loads relevant math packages 
* ```\frenchspacing``` - word and sentence spacing more in line with modern usage and styles

Other global options that I have added are as follow, with a brief description for each. Details are found in the next section.

* ```cm``` - use CM fonts from AMS, Blue Sky, and Y&Y
* ```lm```  - use Latin Modern font
* ```mlm``` - use ```mlmodern``` font
* ```tmx``` - use ```newtxtext``` and ```newtxmath``` fonts
* ```palatino``` - use ```newpxtext``` and ```newpxmath``` fonts
* ```minion``` - use Minion Pro via the ```MinionPro``` package
* ```charter``` - use ```XCharter``` with math support from ```newtxmath```
* ```nc``` - use New Century with math support via ```fouriernc```
* ```egb``` - use ```egbgaramond``` with math support from ```newtxmath```
* ```bvx``` - use ```Baskervaldx``` with math support from ```newtxmath```
* ```mtpsymb``` - use some preferred math symbols from ```mtpro2```
* ```tables``` - better tables via ```booktabs```
* ```captions``` - better captions via ```caption```
* ```fullpage``` - 1 inch margins via ```geometry```
* ```narrow``` - wide (1.8 inch) left/right margins (narrow ```textwidth```) via ```geometry```
* ```tight``` - tight (0.5 inch) margins via ```geometry```
* ```ars``` - restyle sections in an Ars Classica theme
* ```blockpar``` - use block paragraphs via ```parskip```
* ```footnotes``` - aesthetic adjustments to footnotes, including hanging text if ```blockpar``` is invoked
* ```footnotesroman``` - the same as ```footnotes``` but using roman numbers, so as not to confuse footnotes with bibliography entries.
* ```chem``` - chemistry macros
* ```misc``` - extra useful packages

## Details for Global Options: Fonts

For each font selection (```cm```, ```lm```, ```mlm```, ```tmx```, ```palatino```, ```minion```, ```charter```, ```nc```, ```egb```, and ```bvx```), other supporting packages are loaded for compatibility. **Only one font choice should be invoked. Invoking multiple font choices will result in option clashes.**

### If no font selection is made...

If no font selection is made, then no supporting packages will be loaded. Any packages you need must be invoked in the preamble.

### CM

Example: ```\documentclass[10pt,cm]{jpt}```

This option uses the classic Computer Modern fonts, developed by Blue Sky / Y&Y and released by AMS. In addition, the following supporting packages are also loaded: 

* ```\RequirePackage{setspace}\setstretch{1.1}``` - give linespacing a little extra breathing room. Stretch can be readjusted in the preamble.
* ```\RequirePackage{textgreek}``` - load matching upright Greek in text mode
* ```\RequirePackage[calligra]{emf}``` - load Calligra E for ```\emf```

### LM

Example: ```\documentclass[10pt,lm]{jpt}```

This option uses the expanded Latin Modern fonts. In addition, the following supporting packages are also loaded: 

* ```\RequirePackage[T1]{fontenc}``` - modern T1 encoding
* ```\RequirePackage{lmodern}``` - Latin Modern
* ```\RequirePackage{setspace}\setstretch{1.1}``` - give linespacing a little extra breathing room. Stretch can be readjusted in the preamble.
* ```\RequirePackage{textgreek}``` - load matching upright Greek in text mode
* ```\RequirePackage[calligra]{emf}``` - load Calligra E for ```\emf```

### MLM

Example: ```\documentclass[10pt,mlm]{jpt}```

The ```mlmodern``` package implements a blacker, heavier weight to ```lmodern```. In my opinion, this is a huge improvement that makes CM/LM look less spindly on modern screens and printers. It still needs extra linespacing, so I include that here. Instead of using the more CM-like ```textgreek``` for upright Greek, we use the heavier ```upgreek```, which matches better; I also created ```\text``` aliases for these. Lastly, whereas the Calligra E matches the lighter CM/LM fonts nicely, it is too light for MLM; instead, we use the Boondox calligraphic E.

This option loads the following: 

* ```\RequirePackage[T1]{fontenc}``` - modern T1 encoding
* ```\RequirePackage{mlmodern}``` - Latin Modern
* ```\RequirePackage{setspace}\setstretch{1.1}``` - give linespacing a little extra breathing room. Stretch can be readjusted in the preamble.
* ```\RequirePackage[Symbol]{upgreek}``` - load matching upright Greek in math mode; ```\text``` aliases follow.
* ```\def\textalpha{$\upalpha$}```
* ```\def\textbeta{$\upbeta$}```
* ```\def\textgamma{$\upgamma$}```
* ```\def\textdelta{$\updelta$}```
* ```\def\textepsilon{$\upepsilon$}```
* ```\def\textzeta{$\upzeta$}```
* ```\def\texteta{$\upeta$}```
* ```\def\texttheta{$\uptheta$}```
* ```\def\textiota{$\upiota$}```
* ```\def\textkappa{$\upkappa$}```
* ```\def\textlambda{$\uplambda$}```
* ```\def\textmu{$\upmu$}```
* ```\def\textnu{$\upnu$}```
* ```\def\textxi{$\upxi$}```
* ```\def\textpi{$\uppi$}```
* ```\def\textrho{$\uprho$}```
* ```\def\textsigma{$\upsigma$}```
* ```\def\texttau{$\uptau$}```
* ```\def\textupsilon{$\upupsilon$}```
* ```\def\textphi{$\upphi$}```
* ```\def\textpsi{$\uppsi$}```
* ```\def\textchi{$\upchi$}```
* ```\def\textomega{$\upomega$}```
* ```\RequirePackage[boondox]{emf}``` - load Boondox calligraphic E for ```\emf```

### TMX

Example: ```\documentclass[10pt,tmx]{jpt}```

This option uses Times Roman clone fonts from ```\newtxtext``` with math support from ```\newtxmath```. Here I also include some preferred options and supporting packages. Line spacing is slightly expanded, and matching upright Greek alphabets are included from the Artemisia family via ```textgreek```. The calligraphic E provided by the ```emf``` package is a little bit too tall for the Times fonts, so instead we use ```mathalpha``` which allows for scaling.

* ```\RequirePackage[T1]{fontenc}``` - modern T1 encoding
* ```\RequirePackage[defaultsups,trueslanted]{newtxtext}```- Times font   
* ```\RequirePackage[smallerops]{newtxmath}``` - Times math support
* ```\RequirePackage{setspace}\setstretch{1.1}``` - adjust linespacing
* ```\RequirePackage[artemisia]{textgreek}``` - load matching upright Greek in text mode
* ```\RequirePackage[cal=boondox,calscaled=1.0]{mathalpha}\newcommand{\emf}{\mathcal{E}}```	- load Boondox calligraphic E for ```\emf```

### Palatino

Example: ```\documentclass[10pt,palatino]{jpt}```

This option uses Palatino clone fonts from ```\newpxtext``` with math support from ```\newpxmath```. Here I also include some preferred options and supporting packages. Linespacing is expanded slightly more than what is used for other fonts, and matching upright Greek alphabets are included from the Euler family via ```textgreek```. The matching calligraphic E provided by the ```emf``` package.

* ```\RequirePackage[T1]{fontenc}``` - modern T1 encoding
* ```\RequirePackage[defaultsups]{newpxtext}``` - Palatino font
* ```\RequirePackage[smallerops]{newpxmath}``` - Palatino math support
* ```\RequirePackage{setspace}\setstretch{1.15}``` - expanded linespacing
* ```\RequirePackage[euler]{textgreek}``` - load matching upright Greek in text mode
* ```\RequirePackage[cmr]{emf}``` - load matching calligraphic E for ```\emf```
* ```\RequirePackage{anyfontsize}``` - allow for font size adjustments (avoids font size warnings)

### Minion

Example: ```\documentclass[10pt,minion]{jpt}```

This option uses Minion Pro font via the ```MinionPro``` package, which must be configured with the commercial fonts from Adobe; this setting will not work without a properly configured ```MinionPro``` package. Other supporting packages are included, including ```biolinum``` which provides a complementary sans serif font, enabling of upright Greek alphabets (matching characters are provided by the ```MinionPro``` package), adjustment of linespacing, and provision of a matching ```\emf``` character.

* ```\RequirePackage[minionint,lf]{MinionPro}``` - Minion Pro
* ```\RequirePackage{biolinum}``` - Biolinum
* ```\RequirePackage{setspace}\setstretch{1.1}``` - adjust linespacing 
* ```\RequirePackage{textgreek}``` - load matching upright Greek in text mode
* ```\RequirePackage[cal=boondox,calscaled=1.0]{mathalpha}\newcommand{\emf}{\mathcal{E}}``` - load matching calligraphic E for ```\emf```


### Charter

Example: ```\documentclass[10pt,charter]{jpt}```

This option uses the open source Charter font, along with math support from ```newtxmath```. Other supporting packages are included to adjust linespacing, to provide matching upright Greek alphabets, and to provide a matching ```\emf``` character, scaled to match the Charter font.

* ```\RequirePackage[T1]{fontenc}``` - modern T1 encoding
* ```\RequirePackage{XCharter}``` - Charter
* ```\RequirePackage[xcharter]{newtxmath}``` - Charter math support
* ```\RequirePackage{setspace}\setstretch{1.1}``` - adjust linespacing
* ```\RequirePackage[artemisia]{textgreek}``` - load matching upright Greek in text mode
* ```\RequirePackage[cal=cm,calscaled=0.875]{mathalpha}\newcommand{\emf}{\mathcal{E}}``` - load matching calligraphic E for ```\emf```


### NC

Example: ```\documentclass[10pt,nc]{jpt}```

This option uses a New Century clone font with math support. Other supporting packages are included to adjust linespacing, to provide matching upright Greek alphabets, and to provide a matching ```\emf``` character, scaled to match the New Century font.

* ```\RequirePackage[T1]{fontenc}``` - modern T1 encoding
* ```\RequirePackage{fouriernc}``` - New Century font with math support
* ```\RequirePackage{setspace}\setstretch{1.05}``` - adjust linespacing
* ```\RequirePackage[artemisia]{textgreek}``` - load matching upright Greek in text mode
* ```\RequirePackage[cal=boondox,calscaled=1.05]{mathalpha}\newcommand{\emf}{\mathcal{E}}``` - load matching calligraphic E for ```\emf``` 


### EBG

Example: ```\documentclass[10pt,ebg]{jpt}```

This option uses the EB Garamond font with math support from ```newtxmath```. Other supporting packages are included to provide matching upright Greek alphabets, and to provide a matching ```\emf``` character, scaled to match the EB Garamond font.

* ```\RequirePackage[T1]{fontenc}``` - modern T1 encoding 
* ```\RequirePackage[lf]{ebgaramond}``` - EB Garamond font 
* ```\RequirePackage[ebgaramond]{newtxmath}``` - EB Garamond math support 
* ```\RequirePackage[euler]{textgreek}``` - load matching upright Greek in text mode
* ```\RequirePackage[cal=cm,calscaled=1.0]{mathalpha}\newcommand{\emf}{\mathcal{E}}``` - load matching calligraphic E for ```\emf```  


### BVX

This option uses the Baskervaldx font (Baskerville clone) with math support from ```newtxmath```. Other supporting packages are included to provide matching upright Greek alphabets, and to provide a matching ```\emf``` character, scaled to match the Baskervaldx font.

* ```\RequirePackage[T1]{fontenc}``` - modern T1 encoding 
* ```\RequirePackage{Baskervaldx}``` - Baskervaldx font
* ```\RequirePackage[baskervaldx]{newtxmath}``` - Baskervaldx math support 
* ```\RequirePackage[artemisia]{textgreek}``` - load matching upright Greek in text mode
* ```\RequirePackage[cal=boondox,calscaled=1.05]{mathalpha}\newcommand{\emf}{\mathcal{E}}``` - load matching calligraphic E for ```\emf```  


### MTPSYMB

Example: ```\documentclass[10pt,tmx,mtpsymb]{jpt}```

This option replaces the default integral and summation symbols with those provided by the commercial Mathtime Pro package (```mtpro2```); this setting will not work without a properly configured ```mtpro2``` installation. Mathtime Pro is sold as a premium replacement for Times math fonts, so the ```mtpsymb``` option makes most sense to use alongside the ```tmx``` option; however, it can be used along with any other font selection as well.


## Details for Global Options: Formatting and Layout

The remaining options (```tables```, ```captions```, ```fullpage```, ```narrow```, ```blockpar```, ```ars```, ```footnotes```, and ```footnotesroman```)  will change the formatting and layout of the document. 


### Tables

Example: ```\documentclass[10pt,cm,tables]{jpt}```

This option implements the ```booktabs``` package for better typesetting the tables, and modifies the thickness of the horizontal rules. These thicknesses are set to complement the given font choice.

### Captions

Example: ```\documentclass[10pt,cm,captions]{jpt}```

This option implements the ```captions``` package and simply sets caption labels in bold. It also adjusts the vertical skip between the caption and the table/figure to be more in line with the font's linespacing.

### Fullpage

Example: ```\documentclass[10pt,cm,fullpage]{jpt}```

This option implements the ```geometry``` package and sets all margins to 1 inch. The ```geometry``` package algorithmically redefines headers, footers, and marginnote spacing based on margin availability.

### Narrow

Example: ```\documentclass[10pt,cm,narrow]{jpt}```

This option implements the ```geometry``` package and sets top/bottom margins to 1 inch and left/right margins to 1.8 inch; this gives a "narrow" textwidth dimension for more ideal line widths. The ```geometry``` package algorithmically redefines headers, footers, and marginnote spacing based on margin availability.

### Tight

Example: ```\documentclass[10pt,cm,tight]{jpt}```

This option implements the ```geometry``` package and sets all margins to 0.5 inches for more text per page. The ```geometry``` package algorithmically redefines headers, footers, and marginnote spacing based on margin availability.

### BlockPar

Example: ```\documentclass[10pt,cm,blockpar]{jpt}```	

This option implements the ```parskip``` package to use block paragraphs instead of indented paragraphs. This setting also modifies the behavior of the ```footnotes``` and ```footnotesroman``` options.

### Footnotes

Example: ```\documentclass[10pt,cm,footnotes]{jpt}```	

This option modifies the behavior and formatting the footnotes. The most important way that footnote behavior is modified is by setting the parameter ```\interfootnotelinepenalty=10000``` to attempt to force a footnote always to appear on the same page that it was first referenced. (Sometimes it is unavoidable that a footnote is referenced on one page and then printed on the next page; however, setting this high penalty attempts to avoid that scenario at all costs.) 

In addition, ```\setlength{\skip\footins}{0.5cm}``` increases the gap between footnote text and main body text. 

This option also implements the ```footmisc``` package to force footnotes always to appear at the bottom of the page (using the ```[bottom]``` package option) even when most of the page is empty. If ```blockpar```	is used, then the ```[hang]``` option is also selected from ```footmisc```; in doing so, footnote style as always set to match body text style.

### Footnotesroman

Example: ```\documentclass[10pt,cm,footnotesroman]{jpt}```	

This option works the same way as ```footnotes```, but uses lowercase Roman numerals instead of Arabic numerals for the footnote mark. This setting may be desirable when using a numbered bibliography or numbered endnotes alongside numbered footnotes.

### Ars

Example: ```\documentclass[10pt,palatino,narrow,ars,footnotes,tables,captions]{jpt}```	

The ```ars``` option reproduces the Ars Classica document theme (see the ```ArsClassica``` package by Lorenzo Pantieri) by redefining section, abstract, and title headings. In doing so, two new commands are provided: ```\spacedlowsmallcaps{}``` and ```\spacedallcaps{}```. This option uses the sans serif font Iwona, which looks very nice in spaced all-caps. Letterspacing is achieved with the ```soul``` package.

This option can be used in conjunction with any other global options; however the original Ars Classica document "look" can be best achieved by combining the options ```[10pt,palatino,narrow,ars,footnotes,tables,captions]```.

### Chem

Example: ```\documentclass[10pt,cm,chem]{jpt}```

This option loads a variety of chemistry shortcuts and macros.

* ```\newcommand{\degc}{$^{\circ}$C}```
* ```\newcommand{\myu}[1]{\text{\space#1}}```
* ```\newcommand{\tild}{$\sim$}```
* ```\newcommand{\delg}{$\Delta G$}```
* ```\newcommand{\dgnot}{$\Delta G^{\circ}$}```
* ```\newcommand{\dgfnot}{$\Delta G_{\text{f}}^{\circ}$}```
* ```\newcommand{\dgrxn}{$\Delta G_{\text{rxn}}$}```
* ```\newcommand{\dgnotrxn}{$\Delta G_{\text{rxn}}^{\circ}$}```
* ```\newcommand{\delh}{$\Delta H$}```
* ```\newcommand{\dhrxn}{$\Delta H_{\text{rxn}}$}```
* ```\newcommand{\dhnotrxn}{$\Delta H_{\text{rxn}}^{\circ}$}```
* ```\newcommand{\dhnot}{$\Delta H^{\circ}$}```
* ```\newcommand{\dhf}{$\Delta H_{\text{f}}$}```
* ```\newcommand{\dhfnot}{$\Delta H_{\text{f}}^{\circ}$}```
* ```\newcommand{\dhfus}{$\Delta H_{\text{fus}}$}```
* ```\newcommand{\dhvap}{$\Delta H_{\text{vap}}$}```
* ```\newcommand{\dsnotrxn}{$\Delta S_{\text{rxn}}^{\circ}$}```
* ```\newcommand{\dsnot}{$\Delta S^{\circ}$}```
* ```\newcommand{\dels}{$\Delta S$}```
* ```\newcommand{\essnot}{$S^{\circ}$}```
* ```\newcommand{\electron}{e$^-$}```
* ```\newcommand{\Ecell}{$\emf_{\text{cell}}$}``` 
* ```\newcommand{\Enotcell}{$\emf^{\circ}_{\text{cell}}$}```
* ```\newcommand{\Enot}{$\emf^{\circ}$}```
* ```\newcommand{\Ka}{$K_{\text{a}}$}```
* ```\newcommand{\Kb}{$K_{\text{b}}$}```
* ```\newcommand{\Ksp}{$K_{\text{sp}}$}```
* ```\newcommand{\Keq}{$K_{\text{eq}}$}```
* ```\newcommand{\Kp}{$K_P$}```
* ```\newcommand{\Kc}{$K_{\text{c}}$}```
* ```\newcommand{\pKa}{p$K_{\text{a}}$}```
* ```\newcommand{\pKb}{p$K_{\text{b}}$}```
* ```\newcommand{\dipole}{+\hspace*{-3mm}$\longrightarrow$}```
* ```\newcommand{\cmi}{cm$^{-1}$}```
* ```\newcommand{\cd}{$\cdot$}```
* ```\newcommand{\ub}[2]{$\underbrace{\text{#1}}_{\text{#2}}$} % usage: \ub{top}{bottom}```
* ```\newcommand{\us}[2]{$\underset{\text{#2}}{\text{#1}}$}    % usage: \us{top}{bottom}```
* ```\newcommand{\ffbox}[1]{\fbox{\fbox{\parbox{.95\textwidth}{\centering #1}}}}```

### Misc

Example: ```\documentclass[10pt,cm,misc]{jpt}```

This option loads a variety of other packages that might be useful in your document.

* ```\RequirePackage{graphicx}```
* ```\RequirePackage{float}```
* ```\RequirePackage{xcolor}```
* ```\RequirePackage{siunitx}```
* ```\RequirePackage[all]{nowidow}```
* ```\RequirePackage{nicefrac}```
* ```\def\half{\nicefrac{1}{2}}```
* ```\def\quarter{\nicefrac{1}{4}}```
* ```\def\threequarter{\nicefrac{3}{4}}```
* ```\def\third{\nicefrac{1}{3}}```
* ```\def\twothird{\nicefrac{2}{3}}```
* ```\def\eighth{\nicefrac{1}{8}}```
* ```\def\threeeighth{\nicefrac{3}{8}}```



