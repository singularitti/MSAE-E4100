\LoadClass[11pt]{article}
\ProvidesClass{homework}

\RequirePackage{ifthen}
\RequirePackage{fancyhdr}
\RequirePackage{amsmath,amsthm,amsfonts,amssymb}
% \RequirePackage{pstricks}
% \RequirePackage{pst-node}
\RequirePackage[letterpaper,margin=1.2in]{geometry}

\theoremstyle{plain}
\theoremstyle{definition}
\theoremstyle{remark}

\newtheorem{theorem}{Theorem}
\newtheorem{corollary}{Corollary}
\newtheorem{lemma}{Lemma}
\newtheorem{proposition}{Proposition}
\newtheorem{defn}{Definition}
\newtheorem{Conjecture}{Conjecture}
\newtheorem{claim}{Claim}
\newtheorem{property}{Property}
\newtheorem*{sketch}{Sketch}
\newtheorem{remark}{Remark}
\newtheorem{example}{Example}

\newcommand{\studname}[1]{\gdef\@studname{#1}}
\newcommand{\studmail}[1]{\gdef\@studmail{#1}}
\newcommand{\coursename}[1]{\gdef\@coursename{#1}}
\newcommand{\hwNo}[1]{\gdef\@hwNo{#1}}

\def\ddefloop#1{\ifx\ddefloop#1\else\ddef{#1}\expandafter\ddefloop\fi}

% \bbA, \bbB, ...
\def\ddef#1{\expandafter\def\csname bb#1\endcsname{\ensuremath{\mathbb{#1}}}}
\ddefloop ABCDEFGHIJKLMNOPQRSTUVWXYZ\ddefloop

% \cA, \cB, ...
\def\ddef#1{\expandafter\def\csname c#1\endcsname{\ensuremath{\mathcal{#1}}}}
\ddefloop ABCDEFGHIJKLMNOPQRSTUVWXYZ\ddefloop

% \vA, \vB, ..., \va, \vb, ...
\def\ddef#1{\expandafter\def\csname v#1\endcsname{\ensuremath{\boldsymbol{#1}}}}
\ddefloop ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz\ddefloop

% \valpha, \vbeta, ...,  \vGamma, \vDelta, ...,
\def\ddef#1{\expandafter\def\csname v#1\endcsname{\ensuremath{\boldsymbol{\csname #1\endcsname}}}}
\ddefloop {alpha}{beta}{gamma}{delta}{epsilon}{varepsilon}{zeta}{eta}{theta}{vartheta}{iota}{kappa}{lambda}{mu}{nu}{xi}{pi}{varpi}{rho}{varrho}{sigma}{varsigma}{tau}{upsilon}{phi}{varphi}{chi}{psi}{omega}{Gamma}{Delta}{Theta}{Lambda}{Xi}{Pi}{Sigma}{varSigma}{Upsilon}{Phi}{Psi}{Omega}{ell}\ddefloop

\newcommand\innerprod[1]{\langle #1 \rangle}
\DeclareMathOperator*{\argmin}{arg\,min}
\DeclareMathOperator*{\argmax}{arg\,max}

\let\Oldmaketitle\maketitle
\renewcommand{\maketitle}
{
	\Oldmaketitle
	\thispagestyle{plain}
}

\newcounter{begin}
\setcounter{begin}{1}

%\let\Oldsection=\section
%\renewcommand*{\section}{
%	\ifthenelse{\equal{\value{begin}}{1}}
%	{
%		\setcounter{begin}{0}
%	}
%	{
%		\skipevenpage
%	}
%	\Oldsection
%}

\fancypagestyle{plain}
{
	\fancyhead{}
	\fancyfoot{}
	\fancyfoot[LE,LO]{\@studname \ - \texttt{\@studmail}}
	\fancyfoot[RE,RO] {\thepage}
	\renewcommand{\headrulewidth}{0pt}
}

\pagestyle{fancy}

\fancyhead{}
\fancyfoot{}
\fancyhead[RE,RO]{Problem Set \#\@hwNo}
\fancyhead[LE,LO]{\@coursename}
\fancyfoot[RE,RO] {\thepage}
\fancyfoot[LE,LO]{\@studname \ - \texttt{\@studmail}}
\renewcommand{\footrulewidth}{0.4 pt}

\newcounter{emptypages}
\setcounter{emptypages}{0}

\newcounter{sum}

\newcommand*{\skipevenpage}{
	\newpage
	\if@twoside
	\setcounter{sum}{\value{page}}
	\addtocounter{sum}{\value{emptypages}}
	\ifthenelse{\isodd{\value{sum}}}
	{
	}
	{
		\thispagestyle{empty}
		\hbox{}
		\newpage
		\addtocounter{page}{-1}
		\addtocounter{emptypages}{1}
	}
	{
	}
	\fi
}

\title{\@coursename \ - Problem Set \#\@hwNo}
\author{\@studname \ - \texttt{\@studmail}}
\date{\today}

\endinput