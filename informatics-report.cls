%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not edit this file
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NeedsTeXFormat{LaTeX2e}
\LoadClass{report}
\ProvidesClass{informatics-report}[2012/10/07 Informatics Final Year Project Report Class]

\usepackage{graphicx}
\usepackage[left=4cm, right=3cm, top=2cm, bottom=3cm]{geometry}
\usepackage{layout}
\usepackage{url}
\usepackage{verbatim}
\usepackage{listings}

\usepackage{lmodern}
\renewcommand{\familydefault}{\rmdefault}

\setcounter{secnumdepth}{2} %Section numbering depth
\setcounter{tocdepth}{1} %Table of Contents depth, section only

%Text
\usepackage{setspace}
%\onehalfspacing
\doublespacing

\def\@title{}
\def\@author{}
\def\@supervisor{}
\def\@date{}
\def\@studentID{}
\def\@wordCount{}

\def\date#1{\gdef\@date{#1}}
\def\supervisor#1{\gdef\@supervisor{#1}}
\def\studentID#1{\gdef\@studentID{#1}}
\def\abstractFile#1{\gdef\@abstractFile{#1}}
%\def\wordCount#1{\gdef\@wordCount{#1}}

%Acknowledgements
\newif\ifacknowledgements@
\acknowledgements@false
\def\ackFile#1{\gdef\@ackFile{#1}\acknowledgements@true}

\def\createFrontMatter{

	%Title Page
            \thispagestyle{empty}
	\newgeometry{top=0.8in}
	\begin{center}
		{\large
			\begin{flushright}
			      \includegraphics[scale=0.4]{FrontMatter/logo.png}\\*
			\end{flushright}
			\vspace*{0.4in}
			{\huge \bf{\@title}}\\*
			\begin{center}
			      \includegraphics[scale=0.15]{kings.png}\\*
			\vspace*{0.2in}
			\vspace*{0.5in}
			\large{Author: \@author\\*
			           Supervisor: \@supervisor}\\*
			           Student ID: \@studentID\\*
			\vspace*{0.2in}
			{\@date}\\*
		}
	\end{center}
	\restoregeometry
	
	\thispagestyle{empty}%
    \newgeometry{top=2in}
\begin{center}
   \textbf{Abstract}\\ \newline 
   \newline % This will add the new space after "Abstract"
    \vspace{1cm} % This will add the new space after "Abstract"

   \justifying
   \newline
Deep Neural Networks have received significant attention due to their unparalleled capacity to learn features from input data, thereby enhancing task performance. However, the learned features are not encoded in a form that is understandable by humans, making it difficult to ensure that decisions are not simply a result of spurious correlations in the data. With the goal of addressing this issue, interpretability of neural networks has become a prominent research direction. However, attempts to generate explanations have resulted in an apparent trade-off between faithfulness and interpretability. In short, the more faithful (i.e. accurate) the explanation with respect to the underlying model, the harder it is for humans to understand.

 

This thesis presents three major contributions — the first is the overarching framework that harmonises faithfulness and interpretability, the second and third contributions represent novel methods for implementing this overarching framework. In the proposed framework, instead of assigning significance scores to individual features or simplifying inputs into binary importance, correlated features are grouped together and a singular importance score is assigned to each cluster. A second contribution comprises a set of tools as to how features can be best clustered for the simplified explanation to be meaningful as well as interpretable. The final contribution defines two sets of forward-propagation rules each with their own advantages and disadvantages for assigning an importance value to a cluster of features.

 

This detailed account of each feature cluster’s role enhances the clarity of the model's complex decision-making. However, despite this detail, interpretability is not compromised, as each feature cluster is assigned a singular, clear metric. Additionally, these individual importance scores allow for a hierarchy of feature clusters, displaying which most influence the model's decision. Such an ordered representation not only simplifies the explanation for human understanding but also retains the subtle distinctions among features that are crucial for a faithful representation of the model's behaviour. The validity of these methods are demonstrated on large-scale pre-trained convolutional neural networks, and performance is compared with existing relevance methods. The results show a promising solution for interpreting deep neural networks, providing valuable insights into the inner workings of these models while maintaining human-comprehensibility and faithfulness to the model.
	
	%Originality Avowal
	\newpage
	\thispagestyle{empty}%
  	\begin{center}
       		\textbf{Originality Avowal}\\*
                        \justifying
		
I hereby declare that except where specific reference is made to the work of 
others, the contents of this dissertation are original and have not been 
submitted in whole or in part for consideration for any other degree or 
qualification in this, or any other university. This dissertation is my own 
work and contains nothing which is the outcome of work done in collaboration 
with others, except as specified in the text and Acknowledgements. This 
dissertation contains fewer than 100,000 words including appendices, 
bibliography, footnotes, tables and equations and has fewer than 150 figures.\\
			\end{flushleft}
  		\begin{flushright}
        		      \normalsize{\@author}\\*
		      \normalsize{\@date}\\*
		      %\normalsize{Word count: \@wordCount}
  		\end{flushright}
  	\end{center}

	%Acknowledgements
  	\ifacknowledgements@{
    	     \clearpage
    	     \thispagestyle{empty}
   	     \vspace*{1in}
    	          \begin{center}
      	              {\textbf{Acknowledgements}} \\*
    	         \end{center}
    	         \begin{quotation}
		\begin{flushleft}
     	               \input{\@ackFile}
		\end{flushleft}
                    \end{quotation}
          }\fi	
\end{center}
	\restoregeometry
% \setcounter{page}{0}	
% }

\renewcommand{\bibname}{References}
