%% jpt custom class based on article

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{jpt}
              [2021/10/01 v1.0
 Modified LaTeX article class]
\newcommand\@ptsize{}
\newif\if@restonecol
\newif\if@titlepage
\@titlepagefalse
\if@compatibility\else
  \DeclareOption{a4paper}
     {\setlength\paperheight {297mm}%
      \setlength\paperwidth  {210mm}}
  \DeclareOption{a5paper}
     {\setlength\paperheight {210mm}%
      \setlength\paperwidth  {148mm}}
  \DeclareOption{b5paper}
     {\setlength\paperheight {250mm}%
      \setlength\paperwidth  {176mm}}
  \DeclareOption{letterpaper}
     {\setlength\paperheight {11in}%
      \setlength\paperwidth  {8.5in}}
  \DeclareOption{legalpaper}
     {\setlength\paperheight {14in}%
      \setlength\paperwidth  {8.5in}}
  \DeclareOption{executivepaper}
     {\setlength\paperheight {10.5in}%
      \setlength\paperwidth  {7.25in}}
  \DeclareOption{landscape}
     {\setlength\@tempdima   {\paperheight}%
      \setlength\paperheight {\paperwidth}%
      \setlength\paperwidth  {\@tempdima}} 
\fi

% ==========================================================================================
% ==========================================================================================
% ==========================================================================================

% jpt global options/modules

% -- fonts --
\newif\if@cm\DeclareOption{cm}{\@cmtrue} 
\newif\if@lm\DeclareOption{lm}{\@lmtrue} 
\newif\if@mlm\DeclareOption{mlm}{\@mlmtrue} 
\newif\if@tmx\DeclareOption{tmx}{\@tmxtrue} 
\newif\if@palatino\DeclareOption{palatino}{\@palatinotrue}
\newif\if@minion\DeclareOption{minion}{\@miniontrue}
\newif\if@mtpsymb\DeclareOption{mtpsymb}{\@mtpsymbtrue}
\newif\if@charter\DeclareOption{charter}{\@chartertrue}
\newif\if@nc\DeclareOption{nc}{\@nctrue}
\newif\if@ebg\DeclareOption{ebg}{\@ebgtrue}
\newif\if@bvx\DeclareOption{bvx}{\@bvxtrue}

% -- tables and captions
\newif\if@tables\DeclareOption{tables}{\@tablestrue}
\newif\if@captions\DeclareOption{captions}{\@captionstrue}

% -- geometries
\newif\if@fullpage\DeclareOption{fullpage}{\@fullpagetrue}
\newif\if@narrow\DeclareOption{narrow}{\@narrowtrue}
\newif\if@tight\DeclareOption{tight}{\@tighttrue}

% -- ars theme
\newif\if@ars\DeclareOption{ars}{\@arstrue}

% -- block paragraphs
\newif\if@blockpar\DeclareOption{blockpar}{\@blockpartrue}

% -- footnotes, arabic or roman
\newif\if@footnotes\DeclareOption{footnotes}{\@footnotestrue\@footnotesromanfalse}
\newif\if@footnotesroman\DeclareOption{footnotesroman}{\@footnotesromantrue\@footnotesfalse}

% -- other packages
\newif\if@misc\DeclareOption{misc}{\@misctrue}
\newif\if@chem\DeclareOption{chem}{\@chemtrue}

% ==========================================================================================
% ==========================================================================================
% ==========================================================================================

\if@compatibility
  \renewcommand\@ptsize{0}
\else
  \DeclareOption{10pt}{\renewcommand\@ptsize{0}}
\fi
\DeclareOption{11pt}{\renewcommand\@ptsize{1}}
\DeclareOption{12pt}{\renewcommand\@ptsize{2}}
\if@compatibility\else
  \DeclareOption{oneside}{\@twosidefalse \@mparswitchfalse}
\fi
\DeclareOption{twoside}{\@twosidetrue  \@mparswitchtrue}
\DeclareOption{draft}{\setlength\overfullrule{5pt}}
\if@compatibility\else
  \DeclareOption{final}{\setlength\overfullrule{0pt}}
\fi
\DeclareOption{titlepage}{\@titlepagetrue}
\if@compatibility\else
  \DeclareOption{notitlepage}{\@titlepagefalse}
\fi
\if@compatibility\else
  \DeclareOption{onecolumn}{\@twocolumnfalse}
\fi
\DeclareOption{twocolumn}{\@twocolumntrue}
\DeclareOption{leqno}{\input{leqno.clo}}
\DeclareOption{fleqn}{\input{fleqn.clo}}
\DeclareOption{openbib}{%
  \AtEndOfPackage{%
    \renewcommand\@openbib@code{%
      \advance\leftmargin\bibindent
      \itemindent -\bibindent
      \listparindent \itemindent
      \parsep \z@
      }%
    \renewcommand\newblock{\par}}%
}
\ExecuteOptions{letterpaper,10pt,oneside,onecolumn,final}
\ProcessOptions
\input{size1\@ptsize.clo}
\setlength\lineskip{1\p@}
\setlength\normallineskip{1\p@}
\renewcommand\baselinestretch{}
\setlength\parskip{0\p@ \@plus \p@}
\@lowpenalty   51
\@medpenalty  151
\@highpenalty 301
\setcounter{topnumber}{2}
\renewcommand\topfraction{.7}
\setcounter{bottomnumber}{1}
\renewcommand\bottomfraction{.3}
\setcounter{totalnumber}{3}
\renewcommand\textfraction{.2}
\renewcommand\floatpagefraction{.5}
\setcounter{dbltopnumber}{2}
\renewcommand\dbltopfraction{.7}
\renewcommand\dblfloatpagefraction{.5}
\if@twoside
  \def\ps@headings{%
      \let\@oddfoot\@empty\let\@evenfoot\@empty
      \def\@evenhead{\thepage\hfil\slshape\leftmark}%
      \def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
      \let\@mkboth\markboth
    \def\sectionmark##1{%
      \markboth {\MakeUppercase{%
        \ifnum \c@secnumdepth >\z@
          \thesection\quad
        \fi
        ##1}}{}}%
    \def\subsectionmark##1{%
      \markright {%
        \ifnum \c@secnumdepth >\@ne
          \thesubsection\quad
        \fi
        ##1}}}
\else
  \def\ps@headings{%
    \let\@oddfoot\@empty
    \def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
    \let\@mkboth\markboth
    \def\sectionmark##1{%
      \markright {\MakeUppercase{%
        \ifnum \c@secnumdepth >\m@ne
          \thesection\quad
        \fi
        ##1}}}}
\fi
\def\ps@myheadings{%
    \let\@oddfoot\@empty\let\@evenfoot\@empty
    \def\@evenhead{\thepage\hfil\slshape\leftmark}%
    \def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
    \let\@mkboth\@gobbletwo
    \let\sectionmark\@gobble
    \let\subsectionmark\@gobble
    }
\if@titlepage               % jpt titlepage settings                          
  \newcommand\maketitle{\begin{titlepage}%
  \let\footnotesize\small
  \let\footnoterule\relax
  \let \footnote \thanks
  \null\vfil
  \vskip 60\p@
  \begin{center}%
    {\LARGE\@title \par}%            % jpt could add \bfseries
    \vskip 3em%
    {\normalsize                     % jpt this was \large by default
     \lineskip .75em%
      \begin{tabular}[t]{c}%
        \@author
      \end{tabular}\par}%
      \vskip 1.5em%
    {\normalsize \@date \par}%       % jpt this was \large by default
  \end{center}\par
  \@thanks
  \vfil\null
  \end{titlepage}%
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
  }
\else
  \newcommand\maketitle{\par
    \begingroup
      \renewcommand\thefootnote{\@fnsymbol\c@footnote}%
      \def\@makefnmark{\rlap{\@textsuperscript{\normalfont\@thefnmark}}}%
      \long\def\@makefntext##1{\parindent 1em\noindent
              \hb@xt@1.8em{%
                \hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
      \if@twocolumn
        \ifnum \col@number=\@ne
          \@maketitle
        \else
          \twocolumn[\@maketitle]%
        \fi
      \else
      \newpage
        \global\@topnum\z@   % Prevents figures from going at top of page.
        \@maketitle
      \fi
      \thispagestyle{plain}\@thanks
    \endgroup
    \setcounter{footnote}{0}%
    \global\let\thanks\relax
    \global\let\maketitle\relax
    \global\let\@maketitle\relax
    \global\let\@thanks\@empty
    \global\let\@author\@empty
    \global\let\@date\@empty
    \global\let\@title\@empty
    \global\let\title\relax
    \global\let\author\relax
    \global\let\date\relax
    \global\let\and\relax
  }
\def\@maketitle{%            % jpt maketitle
  %\newpage
  %\null
  %\vskip 2em%
  \begin{center}%
  \let \footnote \thanks
    {\LARGE\@title \par}%   % jpt \bfseries
    \vskip 1.5em%
    {\normalsize             % jpt this was \large by default
      \lineskip .5em%
      \begin{tabular}[t]{c}%
        \@author
      \end{tabular}\par}%
    \vskip 1em%
    {\normalsize \@date}%    % jpt this was \large by default
  \end{center}%
  \par
  \vskip 1.5em}
\fi
\setcounter{secnumdepth}{4} % jpt 3 is default
\newcounter {part}
\newcounter {section}
\newcounter {subsection}[section]
\newcounter {subsubsection}[subsection]
\newcounter {paragraph}[subsubsection]
\newcounter {subparagraph}[paragraph]
\renewcommand \thepart {\@Roman\c@part}
\renewcommand \thesection {\@arabic\c@section}
\renewcommand\thesubsection   {\thesection.\@arabic\c@subsection}
\renewcommand\thesubsubsection{\thesubsection.\@arabic\c@subsubsection}
\renewcommand\theparagraph    {\thesubsubsection.\@arabic\c@paragraph}
\renewcommand\thesubparagraph {\theparagraph.\@arabic\c@subparagraph}
\newcommand\part{%
   \if@noskipsec \leavevmode \fi
   \par
   \addvspace{4ex}%
   \@afterindentfalse
   \secdef\@part\@spart}

\def\@part[#1]#2{%
    \ifnum \c@secnumdepth >\m@ne
      \refstepcounter{part}%
      \addcontentsline{toc}{part}{\thepart\hspace{1em}#1}%
    \else
      \addcontentsline{toc}{part}{#1}%
    \fi
    {\parindent \z@ \raggedright
     \interlinepenalty \@M
     \normalfont
     \ifnum \c@secnumdepth >\m@ne
       \Large\bfseries \partname\nobreakspace\thepart
       \par\nobreak
     \fi
     \huge \bfseries #2%
     \markboth{}{}\par}%
    \nobreak
    \vskip 3ex
    \@afterheading}
\def\@spart#1{%
    {\parindent \z@ \raggedright
     \interlinepenalty \@M
     \normalfont
     \huge \bfseries #1\par}%
     \nobreak
     \vskip 3ex
     \@afterheading}
% jpt section edited to match others; all set to \normalsize
\newcommand\section{\@startsection {section}{1}{\z@}%
                                   {-3.25ex \@plus -1ex \@minus -.2ex}% % jpt was -3.5
                                   {1.5ex \@plus.2ex}%                  % jpt was 2.3
                                   {\normalfont\normalsize\bfseries}}   % jpt was \Large
\newcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\normalfont\normalsize\bfseries}}  % jpt was \large
\newcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\normalfont\normalsize\bfseries}}
\newcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
                                    {3.25ex \@plus1ex \@minus.2ex}%
                                    {-1em}%
                                    {\normalfont\normalsize\bfseries}}
\newcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}%
                                       {3.25ex \@plus1ex \@minus .2ex}%
                                       {-1em}%
                                      {\normalfont\normalsize\bfseries}}
\if@twocolumn
  \setlength\leftmargini  {2em}
\else
  \setlength\leftmargini  {2.5em}
\fi
\leftmargin  \leftmargini
\setlength\leftmarginii  {2.2em}
\setlength\leftmarginiii {1.87em}
\setlength\leftmarginiv  {1.7em}
\if@twocolumn
  \setlength\leftmarginv  {.5em}
  \setlength\leftmarginvi {.5em}
\else
  \setlength\leftmarginv  {1em}
  \setlength\leftmarginvi {1em}
\fi
\setlength  \labelsep  {.5em}
\setlength  \labelwidth{\leftmargini}
\addtolength\labelwidth{-\labelsep}
\@beginparpenalty -\@lowpenalty
\@endparpenalty   -\@lowpenalty
\@itempenalty     -\@lowpenalty
\renewcommand\theenumi{\@arabic\c@enumi}
\renewcommand\theenumii{\@alph\c@enumii}
\renewcommand\theenumiii{\@roman\c@enumiii}
\renewcommand\theenumiv{\@Alph\c@enumiv}
\newcommand\labelenumi{\theenumi.}
\newcommand\labelenumii{(\theenumii)}
\newcommand\labelenumiii{\theenumiii.}
\newcommand\labelenumiv{\theenumiv.}
\renewcommand\p@enumii{\theenumi}
\renewcommand\p@enumiii{\theenumi(\theenumii)}
\renewcommand\p@enumiv{\p@enumiii\theenumiii}
\newcommand\labelitemi  {\labelitemfont \textbullet}
\newcommand\labelitemii {\labelitemfont \bfseries \textopenbullet}
\newcommand\labelitemiii{\labelitemfont \textasteriskcentered}
\newcommand\labelitemiv {\labelitemfont \textperiodcentered}
\newcommand\labelitemfont{\normalfont}
\newenvironment{description}
               {\list{}{\labelwidth\z@ \itemindent-\leftmargin
                        \let\makelabel\descriptionlabel}}
               {\endlist}
\newcommand*\descriptionlabel[1]{\hspace\labelsep
                                \normalfont\bfseries #1}
\if@titlepage
  \newenvironment{abstract}{%
      \titlepage
      \null\vfil
      \@beginparpenalty\@lowpenalty
      \begin{center}%
        \bfseries \abstractname
        \@endparpenalty\@M
      \end{center}}%
     {\par\vfil\null\endtitlepage}
\else
  \newenvironment{abstract}{%
      \if@twocolumn
        \section*{\abstractname}%
      \else
        %\small % jpt make abstract font normalsize
        \begin{center}%
          {\bfseries \abstractname\vspace{-0.35em}\vspace{\z@}}% % was -0.5
        \end{center}%
        \quote % jpt was quotation, which uses first line indent
      \fi}
      {\if@twocolumn\else\endquotation\fi}
\fi
\newenvironment{verse}
               {\let\\\@centercr
                \list{}{\itemsep      \z@
                        \itemindent   -1.5em%
                        \listparindent\itemindent
                        \rightmargin  \leftmargin
                        \advance\leftmargin 1.5em}%
                \item\relax}
               {\endlist}
\newenvironment{quotation}
               {\list{}{\listparindent 1.5em%
                        \itemindent    \listparindent
                        \rightmargin   \leftmargin
                        \parsep        \z@ \@plus\p@}%
                \item\relax}
               {\endlist}
\newenvironment{quote}
               {\list{}{\rightmargin\leftmargin}%
                \item\relax}
               {\endlist}
\if@compatibility
  \newenvironment{titlepage}
    {%
      \if@twocolumn
        \@restonecoltrue\onecolumn
      \else
        \@restonecolfalse\newpage
      \fi
      \thispagestyle{empty}%
      \setcounter{page}\z@
    }%
    {\if@restonecol\twocolumn \else \newpage \fi
    }
\else
  \newenvironment{titlepage}
    {%
      \if@twocolumn
        \@restonecoltrue\onecolumn
      \else
        \@restonecolfalse\newpage
      \fi
      \thispagestyle{empty}%
      \setcounter{page}\@ne
    }%
    {\if@restonecol\twocolumn \else \newpage \fi
     \if@twoside\else
        \setcounter{page}\@ne
     \fi
    }
\fi
\newcommand\appendix{\par
  \setcounter{section}{0}%
  \setcounter{subsection}{0}%
  \gdef\thesection{\@Alph\c@section}}
\setlength\arraycolsep{5\p@}
\setlength\tabcolsep{6\p@}
\setlength\arrayrulewidth{.4\p@}
\setlength\doublerulesep{2\p@}
\setlength\tabbingsep{\labelsep}
\skip\@mpfootins = \skip\footins
\setlength\fboxsep{3\p@}
\setlength\fboxrule{.4\p@}
\renewcommand \theequation {\@arabic\c@equation}
\newcounter{figure}
\renewcommand \thefigure {\@arabic\c@figure}
\def\fps@figure{tbp}
\def\ftype@figure{1}
\def\ext@figure{lof}
\def\fnum@figure{\figurename\nobreakspace\thefigure}
\newenvironment{figure}
               {\@float{figure}}
               {\end@float}
\newenvironment{figure*}
               {\@dblfloat{figure}}
               {\end@dblfloat}
\newcounter{table}
\renewcommand\thetable{\@arabic\c@table}
\def\fps@table{tbp}
\def\ftype@table{2}
\def\ext@table{lot}
\def\fnum@table{\tablename\nobreakspace\thetable}
\newenvironment{table}
               {\@float{table}}
               {\end@float}
\newenvironment{table*}
               {\@dblfloat{table}}
               {\end@dblfloat}
\newlength\abovecaptionskip
\newlength\belowcaptionskip
\setlength\abovecaptionskip{10\p@}
\setlength\belowcaptionskip{0\p@}
\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip
  \sbox\@tempboxa{#1: #2}%
  \ifdim \wd\@tempboxa >\hsize
    #1: #2\par
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip}
\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\slshape}{\@nomath\sl}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}
\DeclareRobustCommand*\cal{\@fontswitch\relax\mathcal}
\DeclareRobustCommand*\mit{\@fontswitch\relax\mathnormal}
\newcommand\@pnumwidth{1.55em}
\newcommand\@tocrmarg{2.55em}
\newcommand\@dotsep{4.5}
\setcounter{tocdepth}{4} % jpt 3 is default
\newcommand\tableofcontents{%
    \section*{\contentsname
        \@mkboth{%
           \MakeUppercase\contentsname}{\MakeUppercase\contentsname}}%
    \@starttoc{toc}%
    }
\newcommand*\l@part[2]{%
  \ifnum \c@tocdepth >-2\relax
    \addpenalty\@secpenalty
    \addvspace{2.25em \@plus\p@}%
    \setlength\@tempdima{3em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      {\leavevmode
       \large \bfseries #1\hfil
       \hb@xt@\@pnumwidth{\hss #2%
                          \kern-\p@\kern\p@}}\par
       \nobreak
       \if@compatibility
         \global\@nobreaktrue
         \everypar{\global\@nobreakfalse\everypar{}}%
      \fi
    \endgroup
  \fi}
\newcommand*\l@section[2]{%
  \ifnum \c@tocdepth >\z@
    \addpenalty\@secpenalty
    \addvspace{1.0em \@plus\p@}%
    \setlength\@tempdima{1.5em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode \bfseries
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      #1\nobreak\hfil
      \nobreak\hb@xt@\@pnumwidth{\hss #2%
                                 \kern-\p@\kern\p@}\par
    \endgroup
  \fi}
\newcommand*\l@subsection{\@dottedtocline{2}{1.5em}{2.3em}}
\newcommand*\l@subsubsection{\@dottedtocline{3}{3.8em}{3.2em}}
\newcommand*\l@paragraph{\@dottedtocline{4}{7.0em}{4.1em}}
\newcommand*\l@subparagraph{\@dottedtocline{5}{10em}{5em}}
\newcommand\listoffigures{%
    \section*{\listfigurename}%
      \@mkboth{\MakeUppercase\listfigurename}%
              {\MakeUppercase\listfigurename}%
    \@starttoc{lof}%
    }
\newcommand*\l@figure{\@dottedtocline{1}{1.5em}{2.3em}}
\newcommand\listoftables{%
    \section*{\listtablename}%
      \@mkboth{%
          \MakeUppercase\listtablename}%
         {\MakeUppercase\listtablename}%
    \@starttoc{lot}%
    }
\let\l@table\l@figure
\newdimen\bibindent
\setlength\bibindent{1.5em}
\newenvironment{thebibliography}[1]
     {\section*{\refname}%
      \@mkboth{\MakeUppercase\refname}{\MakeUppercase\refname}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}
\newcommand\newblock{\hskip .11em\@plus.33em\@minus.07em}
\let\@openbib@code\@empty
\newenvironment{theindex}
               {\if@twocolumn
                  \@restonecolfalse
                \else
                  \@restonecoltrue
                \fi
                \twocolumn[\section*{\indexname}]%
                \@mkboth{\MakeUppercase\indexname}%
                        {\MakeUppercase\indexname}%
                \thispagestyle{plain}\parindent\z@
                \parskip\z@ \@plus .3\p@\relax
                \columnseprule \z@
                \columnsep 35\p@
                \let\item\@idxitem}
               {\if@restonecol\onecolumn\else\clearpage\fi}
\newcommand\@idxitem{\par\hangindent 40\p@}
\newcommand\subitem{\@idxitem \hspace*{20\p@}}
\newcommand\subsubitem{\@idxitem \hspace*{30\p@}}
\newcommand\indexspace{\par \vskip 10\p@ \@plus5\p@ \@minus3\p@\relax}
\renewcommand\footnoterule{%
  \kern-3\p@
  \hrule\@width.4\columnwidth
  \kern2.6\p@}
\newcommand\@makefntext[1]{%
    \parindent 1em%
    \noindent
    \hb@xt@1.8em{\hss\@makefnmark}#1}
\newcommand\contentsname{Contents}
\newcommand\listfigurename{List of Figures}
\newcommand\listtablename{List of Tables}
\newcommand\refname{References}
\newcommand\indexname{Index}
\newcommand\figurename{Figure}
\newcommand\tablename{Table}
\newcommand\partname{Part}
\newcommand\appendixname{Appendix}
\newcommand\abstractname{Abstract}
\def\today{\ifcase\month\or
  January\or February\or March\or April\or May\or June\or
  July\or August\or September\or October\or November\or December\fi
  \space\number\day, \number\year}
\setlength\columnsep{10\p@}
\setlength\columnseprule{0\p@}
\pagestyle{plain}
\pagenumbering{arabic}
\if@twoside
\else
  \raggedbottom
\fi
\if@twocolumn
  \twocolumn
  \sloppy
  \flushbottom
\else
  \onecolumn
\fi

% ==========================================================================================
% ==========================================================================================
% ==========================================================================================

% packages
\RequirePackage{comment}
\RequirePackage{microtype}
\RequirePackage{enumitem}\setlist{noitemsep}
\RequirePackage[version=4]{mhchem}
\frenchspacing
\newcommand{\snd}[1]{\setcounter{secnumdepth}{#1}}

% ==========================================================================================
% ==========================================================================================
% ==========================================================================================

% modules

\if@cm
  \RequirePackage{setspace}\setstretch{1.1}
  \RequirePackage{textgreek}
  \RequirePackage[calligra]{emf}
\else
\fi

\if@lm
  \RequirePackage[T1]{fontenc}
  \RequirePackage{lmodern}
  \RequirePackage{setspace}\setstretch{1.1}
  \RequirePackage{textgreek}
  \RequirePackage[calligra]{emf}
\else
\fi

\if@mlm
  \RequirePackage[T1]{fontenc} 
  \RequirePackage{mlmodern}   
  \RequirePackage{setspace}\setstretch{1.1}
  \RequirePackage[Symbol]{upgreek}
    \def\textalpha{$\upalpha$}
    \def\textbeta{$\upbeta$}
    \def\textgamma{$\upgamma$}
    \def\textdelta{$\updelta$}
    \def\textepsilon{$\upepsilon$}
    \def\textzeta{$\upzeta$}
    \def\texteta{$\upeta$}
    \def\texttheta{$\uptheta$}
    \def\textiota{$\upiota$}
    \def\textkappa{$\upkappa$}
    \def\textlambda{$\uplambda$}
    \def\textmu{$\upmu$}
    \def\textnu{$\upnu$}
    \def\textxi{$\upxi$}
    \def\textpi{$\uppi$}
    \def\textrho{$\uprho$}
    \def\textsigma{$\upsigma$}
    \def\texttau{$\uptau$}
    \def\textupsilon{$\upupsilon$}
    \def\textphi{$\upphi$}
    \def\textpsi{$\uppsi$}
    \def\textchi{$\upchi$}
    \def\textomega{$\upomega$}
  \RequirePackage[boondox]{emf}
\else
\fi

\if@tmx
  \RequirePackage[T1]{fontenc}
  \RequirePackage[defaultsups,trueslanted]{newtxtext}   
  \RequirePackage[smallerops]{newtxmath} 
  \RequirePackage{setspace}\setstretch{1.1}
  \RequirePackage[artemisia]{textgreek}
  \RequirePackage[cal=boondox,calscaled=1.0]{mathalpha}\newcommand{\emf}{\mathcal{E}} 
\else %
\fi

\if@palatino
  \RequirePackage[T1]{fontenc}
  \RequirePackage[defaultsups]{newpxtext}
  \RequirePackage[smallerops]{newpxmath}
  \RequirePackage{setspace}\setstretch{1.15}
  \RequirePackage[euler]{textgreek}
  \RequirePackage[cmr]{emf}
  \RequirePackage{anyfontsize}
\else
\fi

\if@minion
  \RequirePackage[minionint,lf]{MinionPro}
  \RequirePackage{biolinum}
  \RequirePackage{setspace}\setstretch{1.1}
  \RequirePackage{textgreek} 
  \RequirePackage[cal=boondox,calscaled=1.0]{mathalpha}\newcommand{\emf}{\mathcal{E}} 
\else 
\fi

\if@charter
  \RequirePackage[T1]{fontenc}
  \RequirePackage{XCharter}
  \RequirePackage[xcharter]{newtxmath}
  \RequirePackage{setspace}\setstretch{1.1}
  \RequirePackage[artemisia]{textgreek}
  \RequirePackage[cal=cm,calscaled=0.875]{mathalpha}\newcommand{\emf}{\mathcal{E}} 
\else
\fi

\if@nc
  \RequirePackage[T1]{fontenc}
  \RequirePackage{fouriernc}
  \RequirePackage{setspace}\setstretch{1.05}
  \RequirePackage[artemisia]{textgreek}
  \RequirePackage[cal=boondox,calscaled=1.05]{mathalpha}\newcommand{\emf}{\mathcal{E}} 
\else
\fi

\if@ebg
  \RequirePackage[T1]{fontenc} 
  \RequirePackage[lf]{ebgaramond}
  \RequirePackage[ebgaramond]{newtxmath} 
  \RequirePackage[euler]{textgreek}
  \RequirePackage[cal=cm,calscaled=1.0]{mathalpha}\newcommand{\emf}{\mathcal{E}} 
\else
\fi

\if@bvx
  \RequirePackage[T1]{fontenc} 
  \RequirePackage{Baskervaldx}
  \RequirePackage[baskervaldx]{newtxmath} 
  \RequirePackage[artemisia]{textgreek}
  \RequirePackage[cal=boondox,calscaled=1.05]{mathalpha}\newcommand{\emf}{\mathcal{E}} 
  \else
\fi

\if@mtpsymb
  \DeclareFontFamily{U}{mtt}{}
    \DeclareFontShape{U}{mtt}{m}{up}{<->mt2exa}{}
  \DeclareSymbolFont{splgreek}{U}{mtt}{m}{up}
    \SetSymbolFont{splgreek}{normal}{U}{mtt}{m}{up}
      \DeclareMathSymbol{\splsum}{\mathop}{splgreek}{"50}
      \let\sum\splsum
      \DeclareMathSymbol{\intop}{\mathop}{splgreek}{"52}
\else
\fi

\if@ars
  \renewcommand{\sfdefault}{iwona}
  \RequirePackage{soul}
  \RequirePackage{textcase}
  \DeclareRobustCommand{\spacedallcaps}[1]{\textls[220]{\MakeTextUppercase{\sffamily #1}}}
  \DeclareRobustCommand{\spacedlowsmallcaps}[1]{\textls[80]{\MakeTextLowercase{\scshape\sffamily #1}}}
  \renewcommand{\abstractname}{\spacedallcaps{Abstract}}
  \RequirePackage[explicit]{titlesec}
    \titleformat{\section}{\sffamily\bfseries}{\thesection}{1.5em}{\spacedallcaps{#1}}
    \titleformat{\subsection}{\sffamily\bfseries}{\thesubsection}{1.5em}{\spacedallcaps{#1}}
    \titleformat{\subsubsection}{\sffamily\bfseries}{\thesubsubsection}{1.5em}{\spacedallcaps{#1}}  
  \def\@maketitle{%            
    \begin{center}%
    \let \footnote \thanks
      {\LARGE\spacedallcaps{\@title} \par}
        \vskip 1.5em%
      {\normalsize             
        \lineskip .5em%
        \begin{tabular}[t]{c}%
          \@author
        \end{tabular}\par}%
      \vskip 1em%
      {\normalsize \@date}%    
    \end{center}%
    \par
    \vskip 1.5em}
  \setcounter{secnumdepth}{0}
\else
\fi

\if@fullpage
  \RequirePackage[top=1in, bottom=1in, left=1in, right=1in]{geometry}  
\else
\fi

\if@narrow
  \RequirePackage[top=1in, bottom=1in, left=1.8in, right=1.8in]{geometry}  
\else
\fi

\if@tight
  \RequirePackage[top=0.5in, bottom=0.5in, left=0.5in, right=0.5in, includefoot]{geometry}  
\else
\fi

\if@footnotes
  \if@blockpar
    \RequirePackage[bottom,hang]{footmisc}
    \setlength\footnotemargin{0.75em}
  \else
    \RequirePackage[bottom]{footmisc}
  \fi
  \interfootnotelinepenalty=10000
  \setlength{\skip\footins}{0.5cm}
\else
\fi

\if@footnotesroman
  \if@blockpar
    \RequirePackage[bottom,hang]{footmisc}
    \setlength\footnotemargin{0.75em}
  \else
    \RequirePackage[bottom]{footmisc}
  \fi
  \interfootnotelinepenalty=10000
  \setlength{\skip\footins}{0.5cm}
  \renewcommand{\thefootnote}{\textit{\roman{footnote}}}
\else
\fi

\if@blockpar
  \RequirePackage{parskip}
\else
\fi

\if@tables
  \RequirePackage{booktabs}
  \setlength\heavyrulewidth{0.20ex}
  \setlength\cmidrulewidth{0.15ex}
  \setlength\lightrulewidth{0.1ex}
  \if@cm
    \setlength\heavyrulewidth{0.15ex}
    \setlength\cmidrulewidth{0.125ex}
    \setlength\lightrulewidth{0.1ex}
  \else
  \fi
  \if@lm
    \setlength\heavyrulewidth{0.15ex}
    \setlength\cmidrulewidth{0.125ex}
    \setlength\lightrulewidth{0.1ex}
  \else 
  \fi 
  \if@ebg
    \setlength\heavyrulewidth{0.17ex}
    \setlength\cmidrulewidth{0.135ex}
    \setlength\lightrulewidth{0.1ex}
  \else 
  \fi 
\else
\fi

\if@captions
  \RequirePackage[font=normalsize,labelfont={bf}]{caption}
  \captionsetup[table]{aboveskip=0.25em}
  \captionsetup[figure]{skip=0.75em}
\else
\fi

\if@misc
  \RequirePackage{graphicx}
  \RequirePackage{float}
  \RequirePackage{xcolor}
  \RequirePackage{siunitx}
  \RequirePackage[all]{nowidow}
  \RequirePackage{nicefrac}
    \def\half{\nicefrac{1}{2}}
    \def\quarter{\nicefrac{1}{4}}
    \def\threequarter{\nicefrac{3}{4}}
    \def\third{\nicefrac{1}{3}}
    \def\twothird{\nicefrac{2}{3}}
    \def\eighth{\nicefrac{1}{8}}
    \def\threeeighth{\nicefrac{3}{8}}
\else
\fi

\if@chem
  \newcommand{\degc}{$^{\circ}$C}
  \newcommand{\myu}[1]{\text{\space#1}}
  \newcommand{\tild}{$\sim$}
  \newcommand{\delg}{$\Delta G$}
  \newcommand{\dgnot}{$\Delta G^{\circ}$}
  \newcommand{\dgfnot}{$\Delta G_{\text{f}}^{\circ}$}
  \newcommand{\dgrxn}{$\Delta G_{\text{rxn}}$}
  \newcommand{\dgnotrxn}{$\Delta G_{\text{rxn}}^{\circ}$}
  \newcommand{\delh}{$\Delta H$}
  \newcommand{\dhrxn}{$\Delta H_{\text{rxn}}$}
  \newcommand{\dhnotrxn}{$\Delta H_{\text{rxn}}^{\circ}$}
  \newcommand{\dhnot}{$\Delta H^{\circ}$}
  \newcommand{\dhf}{$\Delta H_{\text{f}}$}
  \newcommand{\dhfnot}{$\Delta H_{\text{f}}^{\circ}$}
  \newcommand{\dhfus}{$\Delta H_{\text{fus}}$}
  \newcommand{\dhvap}{$\Delta H_{\text{vap}}$}
  \newcommand{\dsnotrxn}{$\Delta S_{\text{rxn}}^{\circ}$}
  \newcommand{\dsnot}{$\Delta S^{\circ}$}
  \newcommand{\dels}{$\Delta S$}
  \newcommand{\essnot}{$S^{\circ}$}
  \newcommand{\electron}{e$^-$}
  \newcommand{\Ecell}{$\emf_{\text{cell}}$} 
  \newcommand{\Enotcell}{$\emf^{\circ}_{\text{cell}}$}
  \newcommand{\Enot}{$\emf^{\circ}$}
  \newcommand{\Ka}{$K_{\text{a}}$}
  \newcommand{\Kb}{$K_{\text{b}}$}
  \newcommand{\Ksp}{$K_{\text{sp}}$}
  \newcommand{\Keq}{$K_{\text{eq}}$}
  \newcommand{\Kp}{$K_P$}
  \newcommand{\Kc}{$K_{\text{c}}$}
  \newcommand{\pKa}{p$K_{\text{a}}$}
  \newcommand{\pKb}{p$K_{\text{b}}$}
  \newcommand{\dipole}{+\hspace*{-3mm}$\longrightarrow$}
  \newcommand{\cmi}{cm$^{-1}$}
  \newcommand{\cd}{$\cdot$}
  \newcommand{\ub}[2]{$\underbrace{\text{#1}}_{\text{#2}}$} % usage: \ub{top}{bottom}
  \newcommand{\us}[2]{$\underset{\text{#2}}{\text{#1}}$}    % usage: \us{top}{bottom}
  \newcommand{\ffbox}[1]{\fbox{\fbox{\parbox{.95\textwidth}{\centering #1}}}}
\else
\fi


% ==========================================================================================
% ==========================================================================================
% ==========================================================================================

\endinput

%%
%% End of file `jpt.cls'.
