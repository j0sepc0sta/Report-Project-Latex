\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ipb}[2023/01/20 base class]

\LoadClass[11pt,twoside]{report}

\RequirePackage{setspace}
\RequirePackage{graphicx}
\RequirePackage[utf8]{inputenc}
\RequirePackage{glossaries}

\RequirePackage{fancyhdr}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions\relax

\if@twoside
    \setlength\oddsidemargin   {0\p@}
    \setlength\evensidemargin  {0\p@}
    \setlength\marginparwidth {40\p@}
    \setlength\headheight     {15\p@}
\else
    \setlength\oddsidemargin   {0\p@}
    \setlength\evensidemargin  {0\p@}
    \setlength\marginparwidth  {40\p@}
    \setlength\headheight     {15\p@}
  \fi

\paperheight=845pt
\paperwidth=597pt
\marginparsep=10pt
%\oddsidemargin 13pt
%\evensidemargin -0.08in
\marginparwidth=50pt
\marginparpush=5pt
\topmargin=-23pt
\headsep=25pt
\textheight=22cm 
\textwidth=16cm
\footskip=30pt
\hoffset=0pt
\textheight=674pt
\brokenpenalty=10000
\setstretch{1.5} %espacamento

%%%%%%%%%%%%%%%%%% autor%%%%%%%%%%%%%%%%%%%%%%%%%
\def\@author{Aluno}
\def\authnum#1{\gdef\@authnum{#1}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%% curso %%%%%%%%%%%%%%%%%%%%%%%%
\def\course#1{\gdef\@course{#1}}
\def\courseyear#1{\gdef\@courseyear{#1}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%% orientador %%%%%%%%%%%%%%%%%%%
\def\@supervisor{Orientador} % default spelling
\def\supervisor#1{\gdef\@supervisor{#1}}
\def\cosupervisor#1{\gdef\@cosupervisor{#1}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newif
    \iffigurespage
    \figurespagetrue 
\newif
    \iftablespage
    \tablespagetrue
\RequirePackage{ifxetex}
\ifxetex
    \usepackage{fontspec}
\else
    \usepackage[T1]{fontenc} %determina que tipo de fonte é usada
    \usepackage[utf8]{inputenc}
    \usepackage{lmodern} %determina o tipo de letra
    %\usepackage{fourier} %determina o tipo de letra
\fi

\def\prefacesection{\@ifstar\@prefacesection\@@prefacesection}

\def\@prefacesection#1{\chapter*{#1}}

\def\@@prefacesection#1{\chapter*{#1}
                        \addcontentsline{toc}{chapter}{#1}
                        }
%%%%%%%%%%%%%%%%%%%%%%%%% conteudo %%%%%%%%%%%%%%%%%%%%%%%%

\def\afterpreface{\cleardoublepage
                    \tableofcontents
                    \cleardoublepage
                    \iftablespage
                        \cleardoublepage
                        \listoftables
                    \fi
                    \iffigurespage
                        \cleardoublepage
                        \listoffigures
                    \fi
                    \cleardoublepage
                    \lstlistoflistings
	                }
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%% cabeçalho /rodapé d\cap %%%%%%%%%%%
\def\bodystart{%----------------------Opcao 1------------------------------
                \newpage
                \pagenumbering{arabic}
                \pagestyle{fancy}
                \renewcommand{\headrulewidth}{0.4pt}
                \renewcommand{\footrulewidth}{0.4pt}
                \fancyhf{}
                \fancyhead[RO]{\nouppercase{\rightmark}}
                \fancyhead[LE]{\nouppercase{\leftmark}}
                %\fancyhead[LE]{\footnotesize{\leftmark}}
                %\fancyhead[RO]{\footnotesize{\rightmark}}
                %\fancyhead[C]{\nouppercase{\@title}}
                %\fancyhead[C]{\footnotesize{\@title}}
                \fancyfoot[LE,RO]{\nouppercase{\thepage}}
                %\fancyfoot[LO,RE]{\nouppercase{\thepage}}
                %\fancyfoot[LE,RO]{\footnotesize{\thepage}}
                %\fancyfoot[LE,RO]{\nouppercase{P\'{a}gina \thepage\ de \pageref{LastPage}}}
                \fancypagestyle{plain}{%  the preset of fancyhdr 
                \fancyhf{} % clear all header and footer fields
                %\fancyhead[C]{\nouppercase{\@title}}
                 %\fancyhead[C]{\footnotesize{\@title}}
                \fancyfoot[R]{\nouppercase{\thepage}}
                %\fancyfoot[R]{\nouppercase{P\'{a}gina \thepage\ de \pageref{LastPage}}}% except the center
                \renewcommand{\headrulewidth}{0pt}
                \renewcommand{\footrulewidth}{0.4pt}}
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\let\@ldthebibliography\thebibliography
\renewcommand{\thebibliography}[1]{\newpage
                \@ldthebibliography{#1}%
\addcontentsline{toc}{chapter}{\bibname}}
\pagestyle{headings}
\makeatother