%====================================================================
% brounst.cls -- Classe de document pour rapports, manuels et TM
%====================================================================
% Utilisation :
%   \documentclass{brounst}            % a4paper + titlepage par défaut
%   \documentclass[11pt]{brounst}      % toute option est transmise à article
%
% Pages de titre disponibles (à placer après \begin{document}) :
%   \maketitleManuel      \maketitleHEIG     \maketitleHESMASTER
%   \maketitleTM          \maketitleTMdeux   \maketitleSimple
%   \maketitleEquipement
%====================================================================
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{brounst}[2026/09/24 Modele brounst]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\PassOptionsToPackage{table}{xcolor} % \rowcolor dans les tableaux
\LoadClass[a4paper,titlepage]{article}


%====================================================================
% INFORMATIONS DU DOCUMENT (valeurs par défaut)
%====================================================================
% À redéfinir dans le préambule du document, p. ex. :
%   \renewcommand{\titlereport}{Mon titre}
\newcommand{\titlereport}{Titre}
\newcommand{\subtitle}{Nom du cours}
\newcommand{\datedoc}{\today}
\newcommand{\datenumber}{{\number\day.\number\month.\number\year}}
\newcommand{\prof}{Dr. Perceval de Galles}
\newcommand{\auteur}{Provençal le Gaulois}
\newcommand{\expert}{Alexandre Astier}
\newcommand{\nummemoire}{xxxx}
\newcommand{\versiondoc}{Version 1}
\newcommand{\studyname}{Nom de la filière}
\newcommand{\logocompany}{heig_hes.jpg} % logo d'école / entreprise (dossier images/)
\newcommand{\equipements}{Canon EOS 5D Mark III, QooCam 8K, Canon EOS 700D}
\newcommand{\logiciels}{Autopano Giga, Hugin, QooCam Studio, Agisoft Metashape}

\newcommand{\titlelogocompany}{\includegraphics[width=5cm,right]{\logocompany}}
\newcommand{\titleimage}{\includegraphics[width=2.6cm]{latex_logo}}


%====================================================================
% PACKAGES
%====================================================================

% -- Langue et police -------------------------------------------------
\RequirePackage[french]{babel}
% \RequirePackage[T1]{fontenc}   % pdfLaTeX seulement (fontspec gère l'encodage)
% \RequirePackage{lmodern}
\RequirePackage{helvet}
\renewcommand{\familydefault}{\sfdefault}
% \RequirePackage{fontspec}          % XeLaTeX ou LuaLaTeX obligatoire

% \setmainfont{Cadastra-Regular}[
%   Path = ./fonts/,
%   Extension = .ttf,
%   BoldFont       = Cadastra-Bold,
%   ItalicFont     = Cadastra-Italic,
%   BoldItalicFont = Cadastra-BoldItalic,
% ]
% Compiler en terminal latexmk rapport_standard.tex
% \setmainfont{Comic Sans MS}
% \RequirePackage{palatino}
\RequirePackage{fancyhdr}
\RequirePackage{lastpage}
\RequirePackage{microtype} % gestion des césures (retour à la ligne des grands mots avec un -)
\RequirePackage{ragged2e}  % Meilleure gestion des retours à la ligne

% -- Mise en page / géométrie -----------------------------------------
\RequirePackage{geometry}
\RequirePackage[export]{adjustbox}
\RequirePackage{graphicx}
\graphicspath{ {./images/} }

% -- Mathématiques ------------------------------------------------------
\RequirePackage{amsmath}
\RequirePackage{amssymb}

% -- Tableaux -------------------------------------------------------------
\RequirePackage{multicol}
\RequirePackage{multirow}
\RequirePackage{array}
\RequirePackage{esvect}
\RequirePackage{tabularx}
\RequirePackage{longtable}
\RequirePackage{booktabs} % Tableau simplifié
\RequirePackage{moreverb} % vertbatimtabl

% -- Figures / graphiques -------------------------------------------------
\RequirePackage{tikz}
\RequirePackage{caption}
\RequirePackage{subcaption}
\RequirePackage{float}
\usetikzlibrary{positioning, arrows.meta, calc, 3d}
\RequirePackage{pgfplots}
\pgfplotsset{compat=1.17}

% -- Listes ---------------------------------------------------------------
\RequirePackage{enumitem}

% -- Code / listings --------------------------------------------------------
\RequirePackage{listings}
\RequirePackage{xcolor}
\RequirePackage{tcolorbox}

% -- Titres de section ------------------------------------------------------
\RequirePackage{titlesec}

% -- Références, liens et bibliographie --------------------------------------
\RequirePackage{xparse}
% \RequirePackage[hidelinks]{hyperref} % referencing inside document (click on links) - has to be loaded as last !
\RequirePackage{hyperref} % voir \hypersetup plus bas \hypersetup
\RequirePackage{footmisc} % note de bas de page
\RequirePackage{url}
\RequirePackage{cleveref} % Paquet pour des références plus intelligentes
\RequirePackage{alltt}
\RequirePackage{cite} % Bibliographie

% -- Divers -----------------------------------------------------------------
\RequirePackage{afterpage} % page vide
\RequirePackage{blindtext}
\RequirePackage{cancel}

%====================================================================
% COULEURS ET LIENS
%====================================================================
\definecolor{primary}{RGB}{0, 0, 0}
\definecolor{myreddark}{RGB}{107, 7, 7}
\definecolor{mygraylight}{rgb}{.9,.9,.9}
\definecolor{accent}{RGB}{190, 60, 40}
\definecolor{green}{RGB}{50, 190, 40}
\definecolor{violet}{RGB}{202, 117, 241}
\definecolor{link}{RGB}{10, 40, 140}
\definecolor{tableheader}{RGB}{150, 150, 180}
\definecolor{codebg}{RGB}{245, 247, 250}
\definecolor{coderule}{RGB}{200, 210, 225}

\renewcommand\UrlFont{\itshape\small}
\let\oldhref\href
\renewcommand{\href}[2]{\oldhref{#1}{\textit{#2}}}

%====================================================================
% MACROS / COMMANDES PERSONNALISÉES
%====================================================================
\newcommand{\descrVarEq}[2]{#1\textrm{ : }&\textrm{#2}}
\newcommand{\avec}{\textrm{\qquad avec}}
\newcommand{\donc}{\textrm{\qquad et donc}}
\newcommand{\figurecentre}[3][7]{
	\begin{figure}[H]
		\includegraphics[width=#1cm,center]{#2}
		\caption{#3}
	\end{figure}
}
\newcommand{\reminterne}[1]{{\color{red}\textbf{#1}}}
\newcommand{\bfit}[1]{\textbf{\textit{#1}}}
\NewDocumentCommand{\paragraphtitle}{O{0.8em} m}{%
  \vspace{#1}%
  \hspace*{0.cm}%
  \textbf{\textit{\normalsize #2}}%
  \vspace{0.5em}%
}

\newcommand{\textcit}[1]{\og\itshape #1\/\fg}
\newcommand{\citemanuel}[1]{\itshape  [#1]}
\newcommand{\sourcefootnotehref}[1]{
	\footnotetext{source : \href{#1}{#1}}
}
\newcommand{\scu}{
	\begin{tikzpicture}[axis/.style={thick,->}]
		\coordinate (O) at (0, 0, 0);
		\draw[axis] (O) -- +(0.3, 0, 0);
		\draw[axis] (O) -- +(0, 0.3, 0);
		\draw[axis] (O) -- +(0, 0, 0.3);
	\end{tikzpicture}
}
\newcommand{\scuxyz}{
	\begin{tikzpicture}[axis/.style={thick,->}]
		\coordinate (O) at (0, 0, 0);
		\draw[axis] (O) -- +(1, 0, 0) node [right] {$X$};
		\draw[axis] (O) -- +(0, 1, 0) node [right] {$Y$};
		\draw[axis] (O) -- +(0, 0, 1) node [above] {$Z$};
	\end{tikzpicture}
}
\newcommand{\norm}[1]{\left\lVert \vec{#1} \right\rVert}
\newcommand\myemptypage{
		\null
		\thispagestyle{empty}
		\addtocounter{page}{-1}
		\newpage
	}



%====================================================================
% MISE EN PAGE GÉNÉRALE
%====================================================================
\geometry{right=2cm, left=2cm, top=2.2cm, bottom=1.8cm} % Indique les dimensions des marges
\setlength\parindent{0pt} % Indique le décalage au début des paragraphes
\setlength{\parskip}{4pt} % Indique l'espace entre chaque "paragraphe"
\setlength{\headheight}{1.6pt}
\setcounter{MaxMatrixCols}{20}
\addtolength{\jot}{0.5em} % Espace entre les équations alignées en verticale
\setcounter{tocdepth}{2} % combien de niveaux sont indiqués dans la table des matières


% -- En-têtes & pieds de page ---------------------------------------------------
\newcommand\fancystandard{
  \pagestyle{fancy}
  \fancyhf{}
  \setlength{\headheight}{8.0pt}
  \addtolength{\topmargin}{0pt}
  \renewcommand{\headrulewidth}{0.4pt}
  \fancyhead[L]{\small\textcolor{primary}{\textbf{\titlereport}}}
  \fancyhead[R]{\small\textcolor{gray}{\nouppercase{\leftmark}}}

  
  % \fancyfoot[C]{\small\thepage}
  \fancyfoot[L]{\datenumber}
  \fancyfoot[R]{\small\thepage/\pageref{LastPage}}
}

\newcommand\fancyOnlyFoot{
		\pagestyle{fancy}
    \fancyhf{}
    \setlength{\headheight}{8.0pt}
    \addtolength{\topmargin}{0pt}
    \renewcommand{\headrulewidth}{0pt}
    % \fancyhead[L]{\small\textcolor{primary}{\textbf{Exercice de photogrammétrie 360°}}}
    % \fancyhead[R]{\small\textcolor{gray}{\nouppercase{\leftmark}}}
    % \fancyfoot[C]{\small\thepage}
    \fancyfoot[L]{\datenumber}
    \fancyfoot[R]{\small\thepage/\pageref{LastPage}}
}



%====================================================================
% TABLEAUX
%====================================================================
\RequirePackage{etoolbox}
% Taille de police générale pour TOUS les tableaux (tabular / tabularx) :
% remplacer \small par \footnotesize ou \scriptsize ci-dessous pour réduire davantage.
\AtBeginEnvironment{tabular}{\small}
\AtBeginEnvironment{tabularx}{\small}
\setlength{\arrayrulewidth}{0.2mm}
\setlength{\tabcolsep}{10pt}
\renewcommand{\arraystretch}{1.5}
\newcommand{\head}[1]{%
\textcolor{white}{\textbf{#1}}}
% -- Colonne talbeau -------------------------------------------------
\newcolumntype{L}[1]{>{\RaggedRight\arraybackslash}m{#1}} %colone de tableau sans texte justifié
\newcolumntype{P}[1]{>{\RaggedRight\arraybackslash}p{#1}}
\newcolumntype{C}[1]{>{\centering\arraybackslash}m{#1}} %colone de tableau centré
\newcolumntype{Y}{>{\centering\arraybackslash}X}  


%====================================================================
% LISTES (itemize / enumerate)
%====================================================================
\setlist{before=\vspace{1pt},after=\vspace{2pt}} % Marge verticale avant et après avec les itemize
\setlist[itemize,1]{nosep, topsep=5pt, partopsep=2pt, itemsep=1.5pt, parsep=1.5pt, leftmargin=3em}
\setlist[itemize,2]{nosep, topsep=2pt, partopsep=2pt, itemsep=1.5pt, parsep=1.5pt, leftmargin=2em}
\setlist[enumerate,1]{nosep, topsep=5pt, partopsep=2pt, itemsep=1.5pt, parsep=1.5pt, leftmargin=3em}
\setlist[enumerate,2]{nosep, topsep=2pt, partopsep=2pt, itemsep=1.5pt, parsep=1.5pt, leftmargin=2em}

\renewcommand{\labelenumii}{\arabic{enumi}.\arabic{enumii}}
\renewcommand{\labelenumiii}{\arabic{enumi}.\arabic{enumii}.\arabic{enumiii}}
\renewcommand{\labelenumiv}{\arabic{enumi}.\arabic{enumii}.\arabic{enumiii}}


%====================================================================
% TITRES DE SECTION
%====================================================================
\titleformat{\section}
  {\normalfont\LARGE\bfseries} % taille, police
  {\thesection}{1em}{\MakeUppercase} % numérotation, espacement

% -- SECTION AVEC LIGNE EN DESSOUS ----------------------------------

% \titleformat{\section}
%   {\normalfont\LARGE\bfseries}   % style du titre
%   {\thesection}                  % numéro
%   {1em}                          % espace entre numéro et titre
%   {\MakeUppercase}                             % rien avant le titre
%   [\titlerule]                   % --- ce qui vient APRÈS, collé au titre

% \titlespacing*{\section}
%   {0pt}                          % indentation gauche
%   {3.5ex plus 1ex minus .2ex}    % espace AVANT le titre
%   {2.0ex plus .2ex}              % espace APRÈS la ligne (avant le texte suivant)

\titleformat{\subsection}
  {\normalfont\Large\bfseries}
  {\thesubsection}{1em}{}
\titleformat{\subsubsection}
  {\normalfont\large\bfseries}
  {\thesubsubsection}{1em}{}

% rajouter la numérotation pour les \paragraphe et \subparagraphe
\setcounter{secnumdepth}{4}
\setcounter{tocdepth}{4}


%====================================================================
% ENCADRÉS PÉDAGOGIQUES
%====================================================================
% Encadré générique (définition, à retenir, exemple...) avec bandeau de titre coloré
\newcommand{\encadretitre}[3][accent]{%
	\par\vspace{0.4em}\noindent
	\begin{tabular}{|p{\dimexpr\linewidth-2\tabcolsep-2\arrayrulewidth\relax}|}
		\hline
		\rowcolor{#1!85!black}\textcolor{white}{\textbf{#2}}\\
		\rowcolor{#1!8}#3\\
		\hline
	\end{tabular}
	\vspace{0.4em}\par
}
\newcommand{\definition}[1]{\encadretitre[link]{Définition}{#1}}
\newcommand{\aretenir}[1]{\encadretitre[accent]{À retenir}{#1}}
\newcommand{\exempleenc}[1]{\encadretitre[mygraylight]{Exemple}{#1}}

\newcommand{\simplebox}[2][accent]{%
  {
    \color{#1}
    \par\vspace{0.4em}\noindent
    \begin{tabular}{|p{\dimexpr0.95\linewidth\tabcolsep-2\arrayrulewidth\relax}|}
      \hline
      \rowcolor{#1!4}\textbf{#2}\\
      \hline
    \end{tabular}
	  \vspace{0.4em}\par
  }
}
\newcommand{\remintbox}[1]{\simplebox[red]{#1}}

\newenvironment{terme}[1]{\paragraphtitle{#1}\par}{\par}

% -- Boîtes ---------------------------------------------------------------------
\tcbuselibrary{skins, breakable}
\newtcolorbox{infobox}[1][]{
  enhanced, breakable,
  colback=link!5, colframe=link,
  fonttitle=\bfseries, title={#1},
  left=6pt, right=6pt, top=4pt, bottom=4pt,
  arc=4pt
}
\newtcolorbox{warningbox}{
  enhanced, breakable,
  colback=orange!8, colframe=orange!70!black,
  fonttitle=\bfseries, title={Attention},
  left=6pt, right=6pt, top=4pt, bottom=4pt,
  arc=4pt
}

%====================== ELEMENT POUR EXERCICE ======================
% Encadré pour réponse et pour solution
\newcommand{\reponseplace}[1]{
\begin{tikzpicture}
    % Carré rempli de couleur
    \fill[black!5!white] (0,0) rectangle (17.0,2);
    % Carré avec contour d'une autre couleur
    \draw[thick, gray] (0,0) rectangle (17.0,2);
    % Texte à l'intérieur
    \node[anchor=north west, text width=16cm, inner sep=0.25cm]
        at (0,2) {\small\itshape\color{red!40!black} #1 };
\end{tikzpicture}
}

\newcommand{\reponseplaceautoheight}[1]{
\begin{tcolorbox}[
    colback=black!5!white,
    colframe=gray,
    boxrule=0.8pt,
    arc=0pt,
    left=4pt, right=4pt, top=4pt, bottom=4pt
]
\small\itshape\color{red!40!black} #1
\end{tcolorbox}
}


%====================================================================
% LISTINGS (CODE)
%====================================================================
\lstdefinestyle{standard}{
  backgroundcolor=\color{codebg},
  frame=single,
  rulecolor=\color{coderule},
  basicstyle=\ttfamily\small\color{mygraylight!40!black},
  breaklines=true,
  columns=flexible,
  numbers=none,
  keepspaces=true,
  xleftmargin=6pt,
  xrightmargin=6pt,
  aboveskip=8pt,
  belowskip=8pt,
}\lstset{style=standard}

% -- Style spécifique Python -------------------------------------------------
\lstdefinestyle{python}{
	backgroundcolor=\color{codebg},
	basicstyle=\ttfamily\small,
	keywordstyle=\color{link}\bfseries,
	commentstyle=\color{mygraylight!40!black}\itshape,
	stringstyle=\color{accent},
	breaklines=true,
  numbers=none,
	frame=single,
	rulecolor=\color{mygraylight},
	framerule=0.4pt,
	xleftmargin=1em,
	xrightmargin=0.5em,
	showstringspaces=false,
	tabsize=4,
	language=Python,
	extendedchars=true,
	literate=
		{á}{{\'a}}1 {à}{{\`a}}1 {â}{{\^a}}1 {é}{{\'e}}1 {è}{{\`e}}1 {ê}{{\^e}}1 {ë}{{\"e}}1
		{î}{{\^i}}1 {ï}{{\"i}}1 {ô}{{\^o}}1 {ö}{{\"o}}1 {ù}{{\`u}}1 {û}{{\^u}}1 {ü}{{\"u}}1
		{ç}{{\c c}}1 {œ}{{\oe}}1
		{À}{{\`A}}1 {É}{{\'E}}1 {È}{{\`E}}1 {Ê}{{\^E}}1 {Ç}{{\c C}}1
}
\lstset{style=python}

% -- Style spécifique SQL -------------------------------------------------
\lstdefinestyle{sqlstyle}{
  language=SQL,
  basicstyle=\ttfamily\scriptsize,
  keywordstyle=\color{myreddark}\bfseries,
  commentstyle=\color{gray}\itshape,
  stringstyle=\color{link},
  showstringspaces=false,
  breaklines=true,
  breakatwhitespace=false,
  frame=single,
  rulecolor=\color{coderule},
  framerule=0.6pt,
  backgroundcolor=\color{codebg},
  numbers=left,
  numberstyle=\tiny\color{gray},
  numbersep=6pt,
  tabsize=2,
  columns=fullflexible,
  xleftmargin=1.5em,
  aboveskip=8pt,
  belowskip=8pt,
}
\lstset{style=sqlstyle}
%====================================================================
% HYPERREF / INFORMATIONS PDF
%====================================================================
\hypersetup{	
  colorlinks=true, 
  linkcolor=black, 
  urlcolor=link, 
  citecolor=black,						% Information sur le document
  pdfauthor = {Della Casa Bruno},			% Auteurs
  pdftitle = {résumé},			% Titre du document
  pdfsubject = {résumé},		% Sujet
  pdfkeywords = {latex},	% Mots-clefs
  pdfstartview={FitH}
}					% ajuste la page à la largueur de l'écran
%pdfcreator = {MikTeX},% Logiciel qui a créé le document
%pdfproducer = {}}


%====================================================================
% INFORMATIONS DU MÉMOIRE (title/author/date)
%====================================================================
\title{\titlereport}
\author{\auteur}
\date{\datedoc}


%====================================================================
% PAGES DE TITRE
%====================================================================
% -- Manuel -------------------------------------------------------------
\newcommand{\maketitleManuel}{%
\begin{titlepage}
	\begin{figure*}
		\titlelogocompany
		\par\vspace{2cm}
	\end{figure*}
	\centering
	\titleimage\par
	{\huge\bfseries\titlereport\par}
	\bigskip
	{\Large \versiondoc\par}
	\vfill
	{\Large \auteur\par}
	\datedoc
\end{titlepage}}

% -- Rapport HEIG-VD ----------------------------------------------------
\newcommand{\maketitleHEIG}{%
\begin{titlepage}
	\begin{figure*}
		\titlelogocompany
		\par\vspace{2cm}
	\end{figure*}
	\centering
	\titleimage
	\par\vspace{1cm}
	\par\noindent\rule{\textwidth}{0.4pt}\vspace{0.4cm}
	{\Huge\bfseries \titlereport }\\[0.3cm]
	{\LARGE \subtitle}\\[0.2cm]
	\par\noindent\rule{\textwidth}{0.4pt}

	{ \color{gray}\textit{ \auteur} \par}
	\vfill
	Professeur: \par
	\prof

	\vfill
	{\large \datedoc\par}

	\versiondoc
\end{titlepage}}

% -- Rapport HES-SO Master ---------------------------------------------
\newcommand{\maketitleHESMASTER}{%
\begin{titlepage}
	\begin{figure*}
		\includegraphics[width=3cm,right]{hes-so_master}
	\end{figure*}
	\centering
	\titleimage
	\par\noindent\rule{\textwidth}{0.4pt}
	{\Huge\bfseries \titlereport\par}\vspace{0.2cm}
	{\Large \subtitle\par}[0.2cm]
	\par\noindent\rule{\textwidth}{0.4pt}

	{\Large \textit{ \auteur} \par}
	\vfill
	Professeur \par
	\prof

	\vfill
	{\large \datedoc\par}
\end{titlepage}}

% -- Travail de master (UNIGE / HES-SO) --------------------------------
\newcommand{\maketitleTM}{%
\begin{titlepage}
	\titleimage

	\par\noindent\rule{\textwidth}{0.1pt}
	{\Huge\bfseries \titlereport\par}\vspace{0.2cm}
	\par\noindent\rule{\textwidth}{0.4pt}

	{\Large \bfseries \auteur \par}
	\vfill
	{\Large \textbf{\datedoc}\par}
	{\Large Domaine Ingénierie et Architecture \par}
	{\large Master conjoint UNIGE-HES-SO en développement territorial\par}
	{\large Orientation Ingénierie géomatique HES-SO\par}
	\vfill
	{\small Directeur : \prof \par}
	{\small Expert : \expert \par}
	\vfill
	{\small Mémoire n° : \nummemoire\par}

	\vfill
	\includegraphics[width=8cm, left]{unige_hes-so.jpg}
\end{titlepage}}

% -- Travail de master, variante 2 (Bachelor + Master) -----------------
\newcommand{\maketitleTMdeux}{%
\begin{titlepage}
	\titleimage

	\par\noindent\rule{\textwidth}{0.1pt}
	{\Huge\bfseries \titlereport\par}\vspace{0.2cm}
	{\Large\noindent \textsc{\studyname}\par}\vspace{0.2cm}
	\par\noindent\rule{\textwidth}{0.4pt}

	{\Large \bfseries \auteur \par}
	\vfill
	{\Large \textbf{\datedoc}\par}
	{\Large Bachelor of Science HES-SO en Génie territorial\par}
	{\large Géomatique et maîtrise foncière\par}
	{\Large Master conjoint UNIGE-HES-SO en développement territorial\par}
	{\large Orientation Ingénierie géomatique HES-SO\par}
	\vfill
	{\small Professeur : Dr. \prof \par}

	\vfill
	\vfill
	\includegraphics[width=8cm, left]{\logocompany}
\end{titlepage}}

% -- Rapport avec équipements / logiciels -----------------------------
\newcommand{\maketitleStandard}{%
\begin{titlepage}
	\begin{figure*}
		\titlelogocompany
	\end{figure*}
	\centering
	\vspace*{5cm}
	\par\noindent\rule{\textwidth}{0.4pt}\vspace{0.4cm}
	{\Huge\bfseries \titlereport }\\[0.3cm]
	{\LARGE \subtitle}\\[0.2cm]
	\par\noindent\rule{\textwidth}{0.4pt}

	{\small\color{gray}\itshape \auteur}
	\vfill
	\begin{tabular}{ll}
		\textbf{Équipements :} & \equipements \\[0.3em]
		\textbf{Logiciels :}   & \logiciels \\
	\end{tabular}

	\vfill
	{\large \datedoc \par}
\end{titlepage}}

% -- Titre simple (pas de page de titre séparée) ------------------------
\newcommand{\maketitleSimple}{%
	{\Huge\bfseries \titlereport\par}
	\par\noindent\rule{\textwidth}{2pt}
}

\endinput
