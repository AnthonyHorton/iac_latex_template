\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{iac}[2017/09/07 International Astronautical Congress conference paper LaTeX class]

\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{amstext}
\RequirePackage{amsfonts}

\LoadClass[twocolumn,letter paper,10pt]{article}

\RequirePackage[margin=2.5cm,top=2.5cm,headheight=\baselineskip]{geometry} % page layout
\RequirePackage{graphicx}
%\RequirePackage{array}
\RequirePackage{booktabs}
\RequirePackage{overcite}
\RequirePackage{lastpage}
\RequirePackage{fancyhdr}
\RequirePackage{lastpage}
\RequirePackage[compact]{titlesec}
\RequirePackage[normalem]{ulem}
\RequirePackage{etoolbox}
\RequirePackage{alphalph}

\renewcommand{\headrulewidth}{0pt}

\newcounter{authcount}
\newcommand{\IACauthor}[2]{%
	\stepcounter{authcount}%
	\csdef{iac@author\theauthcount}{#1}%
	\csdef{iac@affiliation\theauthcount}{#2}}

\setlength\parindent{0.5cm}
\RequirePackage[]{caption}
\captionsetup[figure]{name=Fig.,format=hang,indention=-20pt}
\captionsetup[table]{format=hang,indention=-24pt}

\titlespacing{\section}{0pt}{\baselineskip}{0pt}
\titlespacing{\subsection}{0pt}{\baselineskip}{0pt}
\titlespacing{\subsubsection}{0pt}{\baselineskip}{0pt}
\titleformat{\section}{\normalfont\bfseries}{\thesection.}{0.5em}{}
\titleformat{\subsection}{\normalfont\itshape}{\thesubsection}{0.5em}{}
\titleformat{\subsubsection}{\normalfont\itshape}{\thesubsubsection}{0.5em}{}

\renewcommand{\abstract}[1]{\def\iac@abstract{#1}}
\newcommand*{\IACpaperyear}[1]{\def\iac@paperyear{#1}}\IACpaperyear{}
\newcommand*{\IACpapernumber}[1]{\def\iac@papernumber{#1}}\IACpapernumber{}
\newcommand*{\IACconference}[1]{\def\iac@conference{#1}}\IACconference{}
\newcommand*{\IACcopyright}[1]{\def\iac@copyright{#1}}\IACcopyright{}
\newcommand*{\IAClocation}[1]{\def\iac@location{#1}}\IAClocation{}
\newcommand*{\IACdates}[1]{\def\iac@dates{#1}}\IACdates{}

\newcommand{\IACcopyrightA}[2]{\def\iac@copyright{Copyright \copyright\,#1 by #2. All rights reserved.}}
\newcommand{\IACcopyrightBOne}[2]{\def\iac@copyright{Copyright \copyright\,#1 by #2. Published by the IAF, with permission and released to the IAF to publish in all forms.}}
\newcommand{\IACcopyrightC}{\def\iac@copyright{This material is declared a work of the U.S.\ Government and is not subject to copyright protection in the United States.}}
\newcommand{\IACcopyrightD}[1]{\def\iac@copyright{Copyright \copyright\,#1 by the International Astronautical Federation. The U.S.\ Government has a royalty-free license to exercise all rights under the copyright claimed herein for Governmental purposes. All other rights are reserved by the copyright owner.}}
\newcommand{\IACcopyrightDAPL}[1]{\def\iac@copyright{Copyright \copyright\,#1 by the International Astronautical Federation. Under the copyright claimed herein, the U.S.\ Government has a royalty-free license to exercise all rights for Governmental purposes. All other rights are reserved by the copyright owner.}}
\newcommand\iac@makecopyright{{\iac@copyright}}

\renewcommand\maketitle{\twocolumn[
  \begin{@twocolumnfalse}
  \lhead{}\chead{\footnotesize \iac@conference th International Astronautical Congress (IAC), {\iac@location}, {\iac@dates}.\\ \iac@makecopyright}\rhead{}%
  \lfoot{IAC--\iac@paperyear--\iac@papernumber}\cfoot{}\rfoot{Page \thepage\ of \pageref{LastPage}}%
  \begingroup
    \global\@topnum\z@   % Prevents figures from going at top of page.
    \@maketitle
    \@thanks
  \endgroup
  \global\let\maketitle\relax
  \global\let\@maketitle\relax
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\date\relax
  \global\let\and\relax
  \end{@twocolumnfalse}
  ]}
\def\@maketitle{%
  \newpage
  \begin{center}%
    IAC--\iac@paperyear--\iac@papernumber\par%
    \vskip1em
    {\large \textbf{\@title} \par}%
    \vskip 1.5em%
    {\large
      \lineskip .5em%
      \newcounter{authnum}%
      \setcounter{authnum}{0}
      \whileboolexpr
      { test {\ifnumcomp{\value{authnum}}{<}{\theauthcount}} }%
      {\stepcounter{authnum}%
      	\normalsize\textbf{\csuse{iac@author\theauthnum}}\par%
		\normalsize\csuse{iac@affiliation\theauthnum}\par%
		\vskip 1.5ex%
	  }%
    }%
	\textbf{Abstract}
  \end{center}%
	\indent\iac@abstract\par%
  \vskip 4.5ex}%
  \pagestyle{fancy}%

\makeatletter
\newcommand*{\fnsymbolsingle}[1]{%
  \ensuremath{%
    \ifcase#1%
    \or *%
    \or \dagger
    \or \ddagger
    \or \mathsection
    \or \mathparagraph
    \else
      \@ctrerr
    \fi
  }%
}
\makeatother
\newalphalph{\fnsymbolmult}[mult]{\fnsymbolsingle}{}
\renewcommand*{\thefootnote}{%
  \fnsymbolmult{\value{footnote}}%
}
\makeatletter
	\def\tagform@#1{\maketag@@@{[#1]\@@italiccorr}}
\makeatother
\endinput
