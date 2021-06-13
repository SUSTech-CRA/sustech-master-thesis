%%
%% This is file `thuthesis.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% thuthesis.dtx  (with options: `cls')
%%
%% This is a generated file.
%%
%% Copyright (C) 2005-2020 by Ruini Xue <xueruini@gmail.com>
%%
%% This work may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.3
%% of this license or (at your option) any later version.
%% The latest version of this license is in
%%   http://www.latex-project.org/lppl.txt
%% and version 1.3 or later is part of all distributions of LaTeX
%% version 2005/12/01 or later.
%%
%% To produce the documentation run the original source files ending with `.dtx'
%% through LaTeX.
%%
\NeedsTeXFormat{LaTeX2e}[2017/04/15]
\ProvidesClass{thuthesis}
[2020/10/14 7.1.0 Tsinghua University Thesis Template]
\newcommand\thu@error[1]{%
  \ClassError{thuthesis}{#1}{}%
}
\newcommand\thu@warning[1]{%
  \ClassWarning{thuthesis}{#1}%
}
\newcommand\thu@patch@error[1]{%
  \thu@error{Failed to patch command \protect#1}%
}
\newcommand\thu@deprecate[2]{%
  \def\thu@@tmp{#2}%
  \thu@warning{%
    The #1 is deprecated%
    \ifx\thu@@tmp\@empty\else
      . Use #2 instead%
    \fi
  }%
}
\@ifl@t@r\fmtversion{2017/04/15}{}{
  \thu@error{%
    TeX Live 2017 or later version is required to compile this document%
  }
}
\RequirePackage{iftex}
\ifXeTeX\else
  \thu@error{XeLaTeX is required to compile this document}
\fi
\InputIfFileExists{thuthesis-pdf-test-config.tex}{}{
  \InputIfFileExists{thuthesis-log-test-config.tex}{}{}
}
\hyphenation{Thu-Thesis}
\def\thuthesis{ThuThesis}
\def\version{1.1.6}
\RequirePackage{kvdefinekeys}
\RequirePackage{kvsetkeys}
\RequirePackage{kvoptions}
\SetupKeyvalOptions{
  family=thu,
  prefix=thu@,
  setkeys=\kvsetkeys}
\newcommand\thusetup[1]{%
  \kvsetkeys{thu}{#1}%
}
\newcommand\thu@define@key[1]{%
  \kvsetkeys{thu@key}{#1}%
}
\kv@set@family@handler{thu@key}{%
  \@namedef{thu@#1@@name}{#1}%
  \def\thu@@default{}%
  \def\thu@@choices{}%
  \kv@define@key{thu@value}{name}{%
    \@namedef{thu@#1@@name}{##1}%
  }%
  \@namedef{thu@#1@@check}{}%
  \@namedef{thu@#1@@code}{}%
  \kv@define@key{thu@value}{choices}{%
    \def\thu@@choices{##1}%
    \@namedef{thu@#1@@reset}{}%
    \@namedef{thu@#1@@check}{%
      \@ifundefined{%
        ifthu@\@nameuse{thu@#1@@name}@\@nameuse{thu@\@nameuse{thu@#1@@name}}%
      }{%
        \thu@error{Invalid value "#1 = \@nameuse{thu@\@nameuse{thu@#1@@name}}"}%
      }%
      \@nameuse{thu@#1@@reset}%
      \@nameuse{thu@\@nameuse{thu@#1@@name}@\@nameuse{thu@\@nameuse{thu@#1@@name}}true}%
    }%
  }%
  \kv@define@key{thu@value}{default}{%
    \def\thu@@default{##1}%
  }%
  \kvsetkeys{thu@value}{#2}%
  \@namedef{thu@\@nameuse{thu@#1@@name}}{}%
  \kv@set@family@handler{thu@choice}{%
    \ifx\thu@@default\@empty
      \def\thu@@default{##1}%
    \fi
    \expandafter\newif\csname ifthu@\@nameuse{thu@#1@@name}@##1\endcsname
    \expandafter\g@addto@macro\csname thu@#1@@reset\endcsname{%
      \@nameuse{thu@\@nameuse{thu@#1@@name}@##1false}%
    }%
  }%
  \kvsetkeys@expandafter{thu@choice}{\thu@@choices}%
  \expandafter\let\csname thu@\@nameuse{thu@#1@@name}\endcsname\thu@@default
  \expandafter\ifx\csname thu@\@nameuse{thu@#1@@name}\endcsname\@empty\else
    \@nameuse{thu@#1@@check}%
  \fi
  \kv@define@key{thu}{#1}{%
    \@namedef{thu@\@nameuse{thu@#1@@name}}{##1}%
    \@nameuse{thu@#1@@check}%
    \@nameuse{thu@#1@@code}%
  }%
}
\newcommand\thu@option@hook[2]{%
  \expandafter\g@addto@macro\csname thu@#1@@code\endcsname{#2}%
}
\thu@define@key{
  degree = {
    choices = {
      bachelor,
      master,
      doctor,
      postdoc,
    },
    default = master,
  },
  degree-type = {
    choices = {
      academic,
      professional,
    },
    name = degree@type,
  },
  main-language = {
    name = main@language,
    choices = {
      chinese,
      english,
    },
  },
  language = {
    choices = {
      chinese,
      english,
    },
  },
  fontset = {
    choices = {
      windows,
      mac,
      ubuntu,
      fandol,
      none,
    },
    default = none,
  },
  system = {
    choices = {
      mac,
      unix,
      windows,
      auto,
    },
    default = auto,
  },
  font = {
    choices = {
      times,
      termes,
      xits,
      libertinus,
      lm,
      auto,
      none,
    },
    default = auto,
  },
  cjk-font = {
    name = cjk@font,
    choices = {
      windows,
      mac,
      noto,
      fandol,
      auto,
      none,
    },
    default = auto,
  },
  math-font = {
    name = math@font,
    choices = {
      xits,
      stix,
      libertinus,
      lm,
      none,
    },
    default = xits,
  },
  output = {
    choices = {
      print,
      electronic,
    },
    default = print,
  },
}
\newif\ifthu@degree@graduate
\newcommand\thu@set@graduate{%
  \thu@degree@graduatefalse
  \ifthu@degree@doctor
    \thu@degree@graduatetrue
  \fi
  \ifthu@degree@master
    \thu@degree@graduatetrue
  \fi
}
\thu@set@graduate
\thu@option@hook{degree}{%
  \thu@set@graduate
}
\DeclareBoolOption[false]{openright}
\DeclareComplementaryOption{openany}{openright}
\DeclareBoolOption[true]{raggedbottom}
\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessKeyvalOptions*
\ifthu@openright
  \PassOptionsToClass{openright}{book}
\else
  \PassOptionsToClass{openany}{book}
\fi
\PassOptionsToPackage{quiet}{fontspec}
\LoadClass[a4paper,UTF8,zihao=-4,scheme=plain,fontset=none]{ctexbook}[2017/04/01]
\RequirePackage{etoolbox}
\RequirePackage{filehook}
\RequirePackage{xparse}
\RequirePackage{geometry}%
\RequirePackage{fancyhdr}
\RequirePackage{titletoc}
\RequirePackage{notoccite}
\RequirePackage{amsmath}
\RequirePackage{unicode-math}
\RequirePackage{graphicx}
\RequirePackage[labelformat=simple]{subcaption}
\RequirePackage{pdfpages}
\includepdfset{fitpaper=true}
\RequirePackage[shortlabels]{enumitem}
\RequirePackage{environ}
\ifthu@raggedbottom
  \RequirePackage[bottom,perpage,hang]{footmisc}
  \raggedbottom
\else
  \RequirePackage[perpage,hang]{footmisc}
\fi
\RequirePackage{xeCJKfntef}
\RequirePackage{soul}
\RequirePackage{array}
\RequirePackage{booktabs}
\RequirePackage{url}
\AtEndPreamble{
  \@ifpackageloaded{biblatex}{}{
    \@ifpackageloaded{apacite}{}{
      \RequirePackage{natbib}
    }
  }
}
\AtEndOfPackageFile*{natbib}{
  \@ifpackageloaded{apacite}{}{
    \RequirePackage{bibunits}
  }
}
\newcommand\thu@package@conflict[2]{
  \AtBeginOfPackageFile*{#2}{
    \thu@error{The "#2" package is incompatible with required "#1"}
  }
}
\thu@package@conflict{unicode-math}{amscd}
\thu@package@conflict{unicode-math}{amsfonts}
\thu@package@conflict{unicode-math}{amssymb}
\thu@package@conflict{unicode-math}{bbm}
\thu@package@conflict{unicode-math}{bm}
\thu@package@conflict{unicode-math}{eucal}
\thu@package@conflict{unicode-math}{eufrak}
\thu@package@conflict{unicode-math}{mathrsfs}
% 禁止导入 setspace 包
\AtBeginOfPackageFile*{setspace}{
  \thu@error{The "setspace" package is incompatible with table environment, which will make invalidate the float format}
}
\geometry{
  paper          = a4paper,  % 210 * 297mm
  marginparwidth = 2cm,
  marginparsep   = 0.5cm,
}
\newcommand\thu@set@geometry{%
  \ifthu@degree@bachelor
    \geometry{
      top        = 3.8cm,
      bottom     = 3.2cm,
      left       = 3.2cm,
      right      = 3cm,
      headheight = 0.5cm,
      headsep    = 1.8cm,
      footskip   = 1.45cm,
    }%
    \ifthu@output@print
      \geometry{
        left       = 3.2cm,
        right      = 3cm,
      }%
    \else
      \geometry{
        hmargin    = 3cm,
      }%
    \fi
  \else
    \geometry{
      margin     = 3cm,
      headheight = 0.5cm,
      headsep    = 0.3cm,
      footskip   = 0.8cm,
    }%
  \fi
}
\thu@set@geometry
\thu@option@hook{degree}{\thu@set@geometry}
\thu@option@hook{output}{\thu@set@geometry}
\def\cleardoublepage{%
  \clearpage
  \if@twoside
    \ifthu@output@print
      \ifodd\c@page
      \else
        \thispagestyle{empty}%
        \hbox{}%
        \newpage
        \if@twocolumn
          \hbox{}\newpage
        \fi
      \fi
    \fi
  \fi
}
\renewcommand\frontmatter{%
  \cleardoublepage
  \@mainmatterfalse
  \pagenumbering{Roman}%
}
\renewcommand\mainmatter{%
  \cleardoublepage
  \@mainmattertrue
  \pagenumbering{arabic}%
}
\renewcommand\backmatter{%
  \if@openright
    \cleardoublepage
  \else
    \clearpage
  \fi
  \@mainmatterfalse
  \thusetup{toc-depth = 0}%
}
\ifthu@fontset@mac
  \thusetup{
    font     = times,
    cjk-font = mac,
  }
\else
  \ifthu@fontset@windows
    \thusetup{
      font     = times,
      cjk-font = windows,
    }
  \else
    \ifthu@fontset@fandol
      \thusetup{
        font     = termes,
        cjk-font = fandol,
      }
    \else
      \ifthu@fontset@ubuntu
        \thusetup{
          font     = termes,
          cjk-font = noto,
        }
      \fi
    \fi
  \fi
\fi
\ifthu@system@auto
  \IfFileExists{/System/Library/Fonts/Menlo.ttc}{
    \thusetup{system = mac}
  }{
    \IfFileExists{/dev/null}{
      \IfFileExists{null:}{
        \thusetup{system = windows}
      }{
        \thusetup{system = unix}
      }
    }{
      \thusetup{system = windows}
    }
  }
\fi
\let\thu@font@family@xits\@empty
\newcommand\thu@set@xits@names{%
  \ifx\thu@font@family@xits\@empty
    \IfFontExistsTF{XITSMath-Regular.otf}{%
      \gdef\thu@font@family@xits{XITS}%
      \gdef\thu@font@style@xits@rm{Regular}%
      \gdef\thu@font@style@xits@bf{Bold}%
      \gdef\thu@font@style@xits@it{Italic}%
      \gdef\thu@font@style@xits@bfit{BoldItalic}%
      \gdef\thu@font@name@xits@math@rm{XITSMath-Regular}%
      \gdef\thu@font@name@xits@math@bf{XITSMath-Bold}%
    }{%
      \gdef\thu@font@family@xits{xits}%
      \gdef\thu@font@style@xits@rm{regular}%
      \gdef\thu@font@style@xits@bf{bold}%
      \gdef\thu@font@style@xits@it{italic}%
      \gdef\thu@font@style@xits@bfit{bolditalic}%
      \gdef\thu@font@name@xits@math@rm{xits-math}%
      \gdef\thu@font@name@xits@math@bf{xits-mathbold}%
    }%
  \fi
}
\let\thu@font@family@libertinus\@empty
\newcommand\thu@set@libertinus@names{%
  \ifx\thu@font@family@libertinus\@empty
    \IfFontExistsTF{LibertinusSerif-Regular.otf}{%
      \gdef\thu@font@family@libertinus@serif{LibertinusSerif}%
      \gdef\thu@font@family@libertinus@sans{LibertinusSans}%
      \gdef\thu@font@name@libertinus@math{LibertinusMath-Regular}%
      \gdef\thu@font@style@libertinus@rm{Regular}%
      \gdef\thu@font@style@libertinus@bf{Bold}%
      \gdef\thu@font@style@libertinus@it{Italic}%
      \gdef\thu@font@style@libertinus@bfit{BoldItalic}%
    }{%
      \gdef\thu@font@family@libertinus@serif{libertinusserif}%
      \gdef\thu@font@family@libertinus@sans{libertinussans}%
      \gdef\thu@font@name@libertinus@math{libertinusmath-regular}%
      \gdef\thu@font@style@libertinus@rm{regular}%
      \gdef\thu@font@style@libertinus@bf{bold}%
      \gdef\thu@font@style@libertinus@it{italic}%
      \gdef\thu@font@style@libertinus@bfit{bolditalic}%
    }%
  \fi
}
\ifthu@font@auto
  \ifthu@system@unix
    \thusetup{font=termes}
  \else
    \thusetup{font=times}
  \fi
\fi
\newcommand\thu@load@font@times{%
  \setmainfont{Times New Roman}%
  \setsansfont{Arial}%
  \ifthu@system@mac
    \setmonofont{Menlo}[Scale = MatchLowercase]%
  \else
    \setmonofont{Courier New}[Scale = MatchLowercase]%
  \fi
}
\newcommand\thu@load@font@termes{%
  \setmainfont{texgyretermes}[
    Extension      = .otf,
    UprightFont    = *-regular,
    BoldFont       = *-bold,
    ItalicFont     = *-italic,
    BoldItalicFont = *-bolditalic,
  ]%
  \thu@load@texgyre@sans@mono
}
\newcommand\thu@load@texgyre@sans@mono{%
  \setsansfont{texgyreheros}[
    Extension      = .otf,
    UprightFont    = *-regular,
    BoldFont       = *-bold,
    ItalicFont     = *-italic,
    BoldItalicFont = *-bolditalic,
  ]%
  \setmonofont{texgyrecursor}[
    Extension      = .otf,
    UprightFont    = *-regular,
    BoldFont       = *-bold,
    ItalicFont     = *-italic,
    BoldItalicFont = *-bolditalic,
    Ligatures      = CommonOff,
  ]%
}
\newcommand\thu@load@font@xits{%
  \thu@set@xits@names
  \setmainfont{\thu@font@family@xits}[
    Extension      = .otf,
    UprightFont    = *-\thu@font@style@xits@rm,
    BoldFont       = *-\thu@font@style@xits@bf,
    ItalicFont     = *-\thu@font@style@xits@it,
    BoldItalicFont = *-\thu@font@style@xits@bfit,
  ]%
  \thu@load@texgyre@sans@mono
}
\newcommand\thu@load@font@libertinus{%
  \thu@set@libertinus@names
  \setmainfont{\thu@font@family@libertinus@serif}[
    Extension      = .otf,
    UprightFont    = *-\thu@font@style@libertinus@rm,
    BoldFont       = *-\thu@font@style@libertinus@bf,
    ItalicFont     = *-\thu@font@style@libertinus@it,
    BoldItalicFont = *-\thu@font@style@libertinus@bfit,
  ]%
  \setsansfont{\thu@font@family@libertinus@sans}[
    Extension      = .otf,
    UprightFont    = *-\thu@font@style@libertinus@rm,
    BoldFont       = *-\thu@font@style@libertinus@bf,
    ItalicFont     = *-\thu@font@style@libertinus@it,
  ]%
  \setmonofont{lmmonolt10}[
    Extension      = .otf,
    UprightFont    = *-regular,
    BoldFont       = *-bold,
    ItalicFont     = *-oblique,
    BoldItalicFont = *-boldoblique,
  ]%
}
\@namedef{thu@load@font@lm}{%
  \setmainfont{lmroman10}[
    Extension      = .otf,
    UprightFont    = *-regular,
    BoldFont       = *-bold,
    ItalicFont     = *-italic,
    BoldItalicFont = *-bolditalic,
  ]%
  \setsansfont{lmsans10}[
    Extension      = .otf,
    UprightFont    = *-regular,
    BoldFont       = *-bold,
    ItalicFont     = *-oblique,
    BoldItalicFont = *-boldoblique,
  ]%
  \setmonofont{lmmonolt10}[
    Extension      = .otf,
    UprightFont    = *-regular,
    BoldFont       = *-bold,
    ItalicFont     = *-oblique,
    BoldItalicFont = *-boldoblique,
  ]%
}
\newcommand\thu@load@font{%
  \@nameuse{thu@load@font@\thu@font}%
}
\thu@load@font
\thu@option@hook{font}{\thu@load@font}
\unimathsetup{
  math-style = ISO,
  bold-style = ISO,
  nabla      = upright,
  partial    = upright,
}
\newcommand\thu@load@math@font@xits{%
  \thu@set@xits@names
  \setmathfont{\thu@font@name@xits@math@rm}[
    Extension    = .otf,
    BoldFont     = \thu@font@name@xits@math@bf,
    StylisticSet = 8,
  ]%
  \setmathfont{\thu@font@name@xits@math@rm}[
    Extension    = .otf,
    StylisticSet = 1,
    range        = {cal,bfcal},
  ]%
}
\newcommand\thu@load@math@font@stix{%
  \setmathfont{STIX2Math}[
    Extension    = .otf,
    StylisticSet = 8,
  ]%
  \setmathfont{STIX2Math}[
    Extension    = .otf,
    StylisticSet = 1,
    range        = {cal,bfcal},
  ]%
}
\newcommand\thu@load@math@font@libertinus{%
  \thu@set@libertinus@names
  \setmathfont{\thu@font@name@libertinus@math .otf}%
}
\newcommand\thu@load@math@font@lm{%
  \setmathfont{latinmodern-math.otf}%
}
\newcommand\thu@load@math@font{%
  \@nameuse{thu@load@math@font@\thu@math@font}
}
\thu@load@math@font
\thu@option@hook{math-font}{\thu@load@math@font}
\ifthu@cjk@font@auto
  \ifthu@system@mac
    \thusetup{cjk-font = mac}
  \else
    \ifthu@system@windows
      \thusetup{cjk-font = windows}
    \else
      \IfFontExistsTF{Noto Serif CJK SC}{
        \thusetup{cjk-font = noto}
      }{
        \thusetup{cjk-font = fandol}
      }
    \fi
  \fi
\fi
\newcommand\thu@load@cjk@font@windows{%
  \xeCJKsetup{EmboldenFactor=3}%
  \setCJKmainfont{SimSun}[
    AutoFakeBold = true,
    ItalicFont   = KaiTi,
  ]%
  \setCJKsansfont{SimHei}[AutoFakeBold]%
  \setCJKmonofont{FangSong}%
  \setCJKfamilyfont{zhsong}{SimSun}[AutoFakeBold]%
  \setCJKfamilyfont{zhhei}{SimHei}[AutoFakeBold]%
  \setCJKfamilyfont{zhkai}{KaiTi}%
  \setCJKfamilyfont{zhfs}{FangSong}%
}
\newcommand\thu@load@cjk@font@mac{%
  \setCJKmainfont{Songti SC}[
    UprightFont    = * Light,
    BoldFont       = * Bold,
    ItalicFont     = Kaiti SC,
    BoldItalicFont = Kaiti SC Bold,
  ]%
  \setCJKsansfont{Heiti SC}[BoldFont=* Medium]%
  \setCJKmonofont{STFangsong}
  \setCJKfamilyfont{zhsong}{Songti SC}[
    UprightFont = * Light,
      BoldFont  = * Bold,
  ]%
  \setCJKfamilyfont{zhhei}{Heiti SC}[
    UprightFont = * Light,
    BoldFont    = * Medium,
  ]%
  \setCJKfamilyfont{zhfs}{STFangsong}%
  \setCJKfamilyfont{zhkai}{Kaiti SC}[BoldFont = * Bold]%
  \setCJKfamilyfont{zhli}{Baoli SC}%
  \setCJKfamilyfont{zhyuan}{Yuanyi SC}[
    UprightFont = * Light,
    BoldFont    = * Bold,
  ]%
}
\newcommand\thu@load@cjk@font@noto{%
  \setCJKmainfont{Noto Serif CJK SC}[
    UprightFont    = * Light,
    BoldFont       = * Bold,
    ItalicFont     = FandolKai-Regular,
    ItalicFeatures = {Extension = .otf},
  ]%
  \setCJKsansfont{Noto Sans CJK SC}[
    BoldFont    = * Medium,
  ]%
  \setCJKmonofont{Noto Sans Mono CJK SC}%
  \setCJKfamilyfont{zhsong}{Noto Serif CJK SC}[
    UprightFont = * Light,
    UprightFont = * Bold,
  ]%
  \setCJKfamilyfont{zhhei}{Noto Sans CJK SC}[
    BoldFont    = * Medium,
  ]%
  \setCJKfamilyfont{zhfs}{FandolFang}[
    Extension   = .otf,
    UprightFont = *-Regular,
  ]%
  \setCJKfamilyfont{zhkai}{FandolKai}[
    Extension   = .otf,
    UprightFont = *-Regular,
  ]%
}
\newcommand\thu@load@cjk@font@fandol{%
  \setCJKmainfont{FandolSong}[
    Extension   = .otf,
    UprightFont = *-Regular,
    BoldFont    = *-Bold,
    ItalicFont  = FandolKai-Regular,
  ]%
  \setCJKsansfont{FandolHei}[
    Extension   = .otf,
    UprightFont = *-Regular,
    BoldFont    = *-Bold,
  ]%
  \setCJKmonofont{FandolFang}[
    Extension   = .otf,
    UprightFont = *-Regular,
  ]%
  \setCJKfamilyfont{zhsong}{FandolSong}[
    Extension   = .otf,
    UprightFont = *-Regular,
    BoldFont    = *-Bold,
  ]%
  \setCJKfamilyfont{zhhei}{FandolHei}[
    Extension   = .otf,
    UprightFont = *-Regular,
    BoldFont    = *-Bold,
  ]%
  \setCJKfamilyfont{zhfs}{FandolFang}[
    Extension   = .otf,
    UprightFont = *-Regular,
  ]%
  \setCJKfamilyfont{zhkai}{FandolKai}[
    Extension   = .otf,
    UprightFont = *-Regular,
  ]%
}
\ifthu@cjk@font@none\else
  \providecommand\songti{\CJKfamily{zhsong}}
  \providecommand\heiti{\CJKfamily{zhhei}}
  \providecommand\fangsong{\CJKfamily{zhfs}}
  \providecommand\kaishu{\CJKfamily{zhkai}}
\fi
\newcommand\thu@load@cjk@font{%
  \setCJKfamilyfont{FZXBSJ}[Path = "fonts/",AutoFakeBold]{FZXBSJ.otf}%
  \setCJKfamilyfont{SourceHanSansCN}[Path = "fonts/"]{SourceHanSansCN-Regular.otf}%
  \setCJKfamilyfont{SourceHanSerifCN}[Path = "fonts/"]{SourceHanSerifCN-Regular.otf}%
  \newfontfamily\siyuanheiti@en[Path = "fonts/"]{SourceHanSansCN-Regular.otf}%
  \newfontfamily\siyuansongti@en[Path = "fonts/"]{SourceHanSerifCN-Regular.otf}%
  \@nameuse{thu@load@cjk@font@\thu@cjk@font}%
  \providecommand{\fzxbiaosong}{\CJKfamily{FZXBSJ}}
  \providecommand{\siyuanheiti}{\CJKfamily{SourceHanSansCN}}
  \providecommand{\siyuansongti}{\CJKfamily{SourceHanSerifCN}}
}
\thu@load@cjk@font
\thu@option@hook{cjk-font}{\thu@load@cjk@font}
\renewcommand\normalsize{%
  \@setfontsize\normalsize{12bp}{20bp}%
  \abovedisplayskip 6bp%
  \abovedisplayshortskip 6bp%
  \belowdisplayshortskip 6bp%
  \belowdisplayskip \abovedisplayskip
}
\normalsize
\ifx\MakeRobust\@undefined \else
    \MakeRobust\normalsize
\fi
\DeclareRobustCommand\small{%
   \@setfontsize\small{10.5bp}{17.5bp}%
   \abovedisplayskip 6bp%
   \abovedisplayshortskip 6bp%
   \belowdisplayshortskip 6bp%
   \def\@listi{\leftmargin\leftmargini
               \topsep \z@skip
               \parsep \z@skip
               \itemsep \z@skip}%
   \belowdisplayskip \abovedisplayskip
}
\DeclareRobustCommand\footnotesize{%
   \@setfontsize\footnotesize{9bp}{15bp}%
   \abovedisplayskip 6bp%
   \abovedisplayshortskip 6bp%
   \belowdisplayshortskip 6bp%
   \def\@listi{\leftmargin\leftmargini
               \topsep \z@skip
               \parsep \z@skip
               \itemsep \z@skip}%
   \belowdisplayskip \abovedisplayskip
}
\DeclareRobustCommand\scriptsize{\@setfontsize\scriptsize{7.5bp}{12.5bp}}
\DeclareRobustCommand\tiny{\@setfontsize\tiny{6.5bp}{10.83bp}}
\DeclareRobustCommand\large{\@setfontsize\large{15bp}{25bp}}
\DeclareRobustCommand\Large{\@setfontsize\Large{18bp}{30bp}}
\DeclareRobustCommand\LARGE{\@setfontsize\LARGE{22bp}{36.67bp}}
\DeclareRobustCommand\huge{\@setfontsize\huge{24bp}{40bp}}
\DeclareRobustCommand\Huge{\@setfontsize\Huge{26bp}{43.33bp}}
\def\thu@def@fontsize#1#2{%
  \expandafter\newcommand\csname #1\endcsname[1][1.3]{%
    \fontsize{#2}{##1\dimexpr #2}\selectfont}}
\thu@def@fontsize{chuhao}{42bp}
\thu@def@fontsize{xiaochu}{36bp}
\thu@def@fontsize{yihao}{26bp}
\thu@def@fontsize{xiaoyi}{24bp}
\thu@def@fontsize{erhao}{22bp}
\thu@def@fontsize{xiaoer}{18bp}
\thu@def@fontsize{sanhao}{16bp}
\thu@def@fontsize{xiaosan}{15bp}
\thu@def@fontsize{sihao}{14bp}
\thu@def@fontsize{xiaosi}{12bp}
\thu@def@fontsize{wuhao}{10.5bp}
\thu@def@fontsize{xiaowu}{9bp}
\thu@def@fontsize{liuhao}{7.5bp}
\thu@def@fontsize{xiaoliu}{6.5bp}
\thu@def@fontsize{qihao}{5.5bp}
\thu@def@fontsize{bahao}{5bp}
\thusetup{main-language=\thu@language}%
\let\thu@main@language\thu@language
\thu@option@hook{language}{%
  \ifx\@begindocumenthook\@undefined\else
    \thusetup{main-language=\thu@language}%
    \let\thu@main@language\thu@language
  \fi
}
\newcommand\thu@reset@main@language{%
    \thusetup{language = \thu@main@language}%
    \let\thu@language\thu@main@language
}
\newcommand\thu@set@chapter@names{%
  \ifthu@main@language@chinese
    \ctexset{
      chapter/name   = {第,章},
    }%
    \def\bibname{参考文献}%
    \def\appendixname{附录}%
    \def\indexname{索引}%
    \def\thu@acknowledgements@name{致\quad 谢}%
    \ifthu@degree@bachelor
      \def\contentsname{目\quad 录}%
      \def\listfigurename{插图索引}%
      \def\listtablename{表格索引}%
      \def\thu@list@figure@table@name{插图和附表索引}%
      \def\thu@list@algorithm@name{算法索引}%
      \def\listequationname{公式索引}%
      \def\thu@denotation@name{主要符号对照表}%
      \def\thu@resume@name{在学期间参加课题的研究成果}%
    \else
      \def\listfigurename{插图清单}%
      \def\listtablename{附表清单}%
      \def\thu@list@figure@table@name{插图和附表清单}%
      \def\thu@list@algorithm@name{算法清单}%
      \def\listequationname{公式清单}%
      \ifthu@degree@graduate
        \def\contentsname{目\quad 录}%
        \def\thu@denotation@name{符号和缩略语说明}%
        \def\thu@resume@name{个人简历、在学期间完成的相关学术成果}%
        \def\thu@statement@name{南方科技大学学位论文原创性声明和使用授权说明}%
        \def\thu@statement@toc@name{南方科技大学学位论文原创性声明和使用授权说明}%
      \else  % degree = postdoc
        \def\contentsname{目\qquad 次}%
        \def\thu@denotation@name{符号表}%
        \def\thu@resume@name{个人简历、发表的学术论文与科研成果}%
      \fi
    \fi
  \else
    \ifthu@main@language@english
      \ctexset{
        chapter/name   = CHAPTER\space,
      }%
      \def\indexname{Index}%
      \ifthu@degree@bachelor
        \def\contentsname{CONTENTS}%
        \def\listfigurename{FIGURES}%
        \def\listtablename{TABLES}%
        \def\thu@list@figure@table@name{FIGURES AND TABLES}%
        \def\thu@list@algorithm@name{ALGORITHMS}%
        \def\listequationname{EQUATIONS}%
        \def\thu@denotation@name{ABBREVIATIONS}%
        \def\bibname{REFERENCES}%
        \def\appendixname{APPENDIX}%
        \def\thu@acknowledgements@name{ACKNOWLEDGEMENTS}%
        \def\thu@resume@name{PUBLICATIONS}%
      \else
        \def\contentsname{TABLE OF CONTENTS}%
        \def\listfigurename{List of Figures}%
        \def\listtablename{List of Tables}%
        \def\thu@list@figure@table@name{List of Figures and Tables}%
        \def\thu@list@algorithm@name{List of Algorithms}%
        \def\listequationname{List of Equations}%
        \def\thu@denotation@name{Nomenclature}%
        \def\bibname{REFERENCES}%
        \def\appendixname{APPENDIX}%
        \def\thu@acknowledgements@name{ACKNOWLEDGEMENTS}%
        \def\thu@resume@name{RESUME AND ACADEMIC ACHIEVEMENTS}%
        \def\thu@statement@name{DECLARATION OF ORIGINALITY AND AUTHORIZATION OF THESIS}%
        \def\thu@statement@toc@name{DECLARATION OF ORIGINALITY AND AUTHORIZATION OF THESIS, SOUTHERN UNIVERSITY OF SCIENCE AND TECHNOLOGY}%
      \fi
    \fi
  \fi
}
\thu@set@chapter@names
\thu@option@hook{degree}{\thu@set@chapter@names}
\thu@option@hook{main-language}{\thu@set@chapter@names}
\newcommand\thu@set@names{%
  \ifthu@language@chinese
    \ctexset{
      figurename = 图,
      tablename  = 表,
    }%
    \def\thu@algorithm@name{算法}%
    \def\thu@equation@name{公式}%
    \def\thu@assumption@name{假设}%
    \def\thu@definition@name{定义}%
    \def\thu@proposition@name{命题}%
    \def\thu@lemma@name{引理}%
    \def\thu@theorem@name{定理}%
    \def\thu@axiom@name{公理}%
    \def\thu@corollary@name{推论}%
    \def\thu@exercise@name{练习}%
    \def\thu@example@name{例}%
    \def\thu@remark@name{注释}%
    \def\thu@problem@name{问题}%
    \def\thu@conjecture@name{猜想}%
    \def\thu@proof@name{证明}%
    \def\thu@theorem@separator{：}%
  \else
    \ifthu@language@english
      \ctexset{
        figurename = {Figure},
        tablename  = {Table},
      }%
      \def\thu@algorithm@name{Algorithm}%
      \def\thu@equation@name{Equation}%
      \def\thu@assumption@name{Assumption}%
      \def\thu@definition@name{Definition}%
      \def\thu@proposition@name{Proposition}%
      \def\thu@lemma@name{Lemma}%
      \def\thu@theorem@name{Theorem}%
      \def\thu@axiom@name{Axiom}%
      \def\thu@corollary@name{Corollary}%
      \def\thu@exercise@name{Exercise}%
      \def\thu@example@name{Example}%
      \def\thu@remark@name{Remark}%
      \def\thu@problem@name{Problem}%
      \def\thu@conjecture@name{Conjecture}%
      \def\thu@proof@name{Proof}%
      \def\thu@theorem@separator{: }%
    \fi
  \fi
}
\thu@set@names
\thu@option@hook{language}{\thu@set@names}
\xeCJKDeclareCharClass{CJK}{"2460 -> "2473}
\xeCJKDeclareCharClass{CJK}{"2605}
\newcommand\thu@set@punctuations{%
  \ifthu@language@chinese
    \xeCJKDeclareCharClass{FullLeft}{"2018, "201C}%
    \xeCJKDeclareCharClass{FullRight}{
      "00B7, "2019, "201D, "2013, "2014, "2025, "2026, "2E3A,
    }%
  \else
    \ifthu@language@english
      \xeCJKDeclareCharClass{HalfLeft}{"2018, "201C}%
      \xeCJKDeclareCharClass{HalfRight}{
        "00B7, "2019, "201D, "2013, "2014, "2025, "2026, "2E3A,
      }%
    \fi
  \fi
}
\thu@set@punctuations
\thu@option@hook{language}{\thu@set@punctuations}
\pagestyle{fancy}
\fancypagestyle{plain}{%
  \fancyhf{}%
  \renewcommand\footrulewidth{0pt}%
  \ifthu@degree@bachelor
    \renewcommand\headrulewidth{0pt}%
    \fancyfoot[C]{
      \ifthu@main@language@chinese
        \xiaowu
      \else
        \normalsize
      \fi
      \thepage
    }%
    \let\@mkboth\@gobbletwo
    \let\chaptermark\@gobble
  \else
    \renewcommand\headrulewidth{0.75bp}%
    \fancyhead[C]{\wuhao\leftmark}%
    \fancyfoot[C]{\wuhao\thepage}%
    \let\@mkboth\markboth
    \def\chaptermark##1{%
      \markboth{\CTEXifname{\CTEXthechapter\quad}{}##1}{}%
    }%
  \fi
  \let\sectionmark\@gobble
}
\pagestyle{plain}
\ctexset{chapter/pagestyle = plain}
\ctexset{%
  punct=quanjiao,
  space=auto,
}
\newcommand\thu@set@indent{%
  \ifthu@main@language@english
    \ifthu@degree@bachelor
      \ctexset{autoindent=0.8cm}%
    \else
      \ctexset{autoindent=2}%
    \fi
  \else
    \ctexset{autoindent=2}%
  \fi
}
\thu@set@indent
\thu@option@hook{degree}{\thu@set@indent}
\thu@option@hook{main-language}{\thu@set@indent}
\urlstyle{same}
\g@addto@macro\UrlBreaks{%
  \do0\do1\do2\do3\do4\do5\do6\do7\do8\do9%
  \do\A\do\B\do\C\do\D\do\E\do\F\do\G\do\H\do\I\do\J\do\K\do\L\do\M
  \do\N\do\O\do\P\do\Q\do\R\do\S\do\T\do\U\do\V\do\W\do\X\do\Y\do\Z
  \do\a\do\b\do\c\do\d\do\e\do\f\do\g\do\h\do\i\do\j\do\k\do\l\do\m
  \do\n\do\o\do\p\do\q\do\r\do\s\do\t\do\u\do\v\do\w\do\x\do\y\do\z
}
\Urlmuskip=0mu plus 0.1mu
\partopsep=\z@skip
\def\@listi{\leftmargin\leftmargini
            \parsep \z@skip
            \topsep \z@skip
            \itemsep\z@skip}
\let\@listI\@listi
\@listi
\def\@listii {\leftmargin\leftmarginii
              \labelwidth\leftmarginii
              \advance\labelwidth-\labelsep
              \topsep    \z@skip
              \parsep    \z@skip
              \itemsep   \z@skip}
\def\@listiii{\leftmargin\leftmarginiii
              \labelwidth\leftmarginiii
              \advance\labelwidth-\labelsep
              \topsep    \z@skip
              \parsep    \z@skip
              \partopsep \z@skip
              \itemsep   \z@skip}
\setlist{nosep}
\newcommand\thu@circled[1]{%
  \ifnum#1 >10\relax
    \thu@error{%
      Too many footnotes in this page.
      Keep footnote less than 10%
    }%
  \fi
  {\symbol{\the\numexpr#1+"245F\relax}}%
}
\renewcommand{\thefootnote}{\thu@circled{\c@footnote}}
\renewcommand{\thempfootnote}{\thu@circled{\c@mpfootnote}}
\def\footnoterule{\vskip-3\p@\hrule\@width0.3\textwidth\@height0.4\p@\vskip2.6\p@}
\footnotemargin=13.5bp
\long\def\@makefntext#1{%
  \begingroup
    % 序号取消上标
    \def\@makefnmark{\hbox{\normalfont\@thefnmark}}%
    \xiaowu
    \ifFN@hangfoot
      \bgroup
      \setbox\@tempboxa\hbox{%
        \ifdim\footnotemargin>\z@
          \hb@xt@\footnotemargin{\@makefnmark\hss}%
        \else
          \@makefnmark
        \fi
      }%
      \leftmargin\wd\@tempboxa
      \rightmargin\z@
      \linewidth \columnwidth
      \advance \linewidth -\leftmargin
      \parshape \@ne \leftmargin \linewidth
      % \footnotesize
      \xiaowu
      \@setpar{{\@@par}}%
      \leavevmode
      \llap{\box\@tempboxa}%
      \parskip\hangfootparskip\relax
      \parindent\hangfootparindent\relax
    \else
      \parindent1em%
      \noindent
      \ifdim\footnotemargin>\z@
        \hb@xt@ \footnotemargin{\hss\@makefnmark}%
      \else
        \ifdim\footnotemargin=\z@
          \llap{\@makefnmark}%
        \else
          \llap{\hb@xt@ -\footnotemargin{\@makefnmark\hss}}%
        \fi
      \fi
    \fi
    \footnotelayout#1%
    \ifFN@hangfoot
      \par\egroup
    \fi
  \endgroup
}
\newcommand\thu@set@math@ellipsis{%
  \ifthu@language@chinese
    \DeclareRobustCommand\mathellipsis{\mathinner{\unicodecdots}}%
  \else
    \ifthu@language@english
      \DeclareRobustCommand\mathellipsis{\mathinner{\unicodeellipsis}}%
    \fi
  \fi
}
\thu@set@math@ellipsis
\thu@option@hook{language}{\thu@set@math@ellipsis}
\protected\def\le{\leqslant}
\protected\def\ge{\geqslant}
\AtBeginDocument{%
  \renewcommand\leq{\leqslant}%
  \renewcommand\geq{\geqslant}%
}
\removenolimits{%
  \int\iint\iiint\iiiint\oint\oiint\oiiint
  \intclockwise\varointclockwise\ointctrclockwise\sumint
  \intbar\intBar\fint\cirfnint\awint\rppolint
  \scpolint\npolint\pointint\sqint\intlarhk\intx
  \intcap\intcup\upint\lowint
}
\AtBeginDocument{%
  \renewcommand{\Re}{\operatorname{Re}}%
  \renewcommand{\Im}{\operatorname{Im}}%
}
\AtBeginDocument{%
  \renewcommand\nabla{\mbfnabla}%
}
\DeclareRobustCommand\bm[1]{{\symbf{#1}}}
\DeclareRobustCommand\boldsymbol[1]{{\symbf{#1}}}
\newcommand\square{\mdlgwhtsquare}
\AtBeginDocument{%
  \renewcommand\checkmark{\ensuremath{✓}}%
}
\allowdisplaybreaks[4]
\renewcommand\theequation{\ifnum \c@chapter>\z@ \thechapter-\fi\@arabic\c@equation}
\def\fps@figure{h}
\def\fps@table{h}
\setlength{\floatsep}{6bp}
\setlength{\textfloatsep}{6bp}
\setlength{\intextsep}{6bp}
\setlength{\@fptop}{0bp \@plus1.0fil}
\setlength{\@fpsep}{12bp \@plus2.0fil}
\setlength{\@fpbot}{0bp \@plus1.0fil}
\renewcommand{\textfraction}{0.15}
\renewcommand{\topfraction}{0.85}
\renewcommand{\bottomfraction}{0.65}
\renewcommand{\floatpagefraction}{0.60}
% \ifthu@degree@bachelor
%   \AtBeginDocument{% delay the check until all packages are loaded
%     \g@addto@macro\appendix{\renewcommand*{\thefigure}{\thechapter-\arabic{figure}}}
%     \g@addto@macro\appendix{\renewcommand*{\thetable}{\thechapter-\arabic{table}}}
%   }
% \fi
\DeclareCaptionFont{thu}{%
  \ifthu@degree@bachelor
    \fontsize{11bp}{15bp}\selectfont
  \else
    \ifthu@language@chinese
      \fontsize{11bp}{14.3bp}\selectfont
    \else
      \fontsize{11bp}{12.65bp}\selectfont
    \fi
  \fi
}
\captionsetup{
  font           = thu,
  labelsep       = quad,
  skip           = 6bp,
  figureposition = bottom,
  tableposition  = top,
}
\captionsetup[sub]{font=thu}

% 研究生要求表单元格中的文字采用 11pt 宋体字，单倍行距。段前空 3 磅，段后空 3 磅。
% 对于中文，\cs{arraystretch} 需要调整为 $1 + 6 / (11 \times 1.3) \approx 1.42$。
% 对于英文，\cs{arraystretch} 需要调整为 $1 + 6 / (11 \times 1.15) \approx 1.47$。
%
% 注意不能简单地把行距设为 $\SI{11}{pt} \times 1.3 + \SI{6}{pt} = \SI{20.3}{pt}$，
% 这会导致含有多行文字的单元格中行距有误。

\newcommand\thu@set@table@font{
  \ifthu@language@chinese
    \def\thu@table@font{%
      \fontsize{11bp}{14.3bp}\selectfont
      \renewcommand\arraystretch{1.42}%
    }%
  \else
    \def\thu@table@font{%
      \fontsize{11bp}{12.65bp}\selectfont
      \renewcommand\arraystretch{1.47}%
    }%
  \fi
}
\thu@set@table@font
\thu@option@hook{language}{\thu@set@table@font}
\patchcmd\@floatboxreset{%
  \normalsize
}{%
  \thu@table@font
}{}{\thu@patch@error{\@floatboxreset}}


% longtable 同样设定
\AtEndOfPackageFile*{longtable}{
  \AtBeginEnvironment{longtable}{%
    \thu@table@font
  }
}

% 三线表线的磅数
\heavyrulewidth=1.5bp
\lightrulewidth=1bp

\AtEndOfPackageFile*{threeparttable}{
  \AtBeginEnvironment{threeparttable}{%
    \thu@table@font
  }
  \g@addto@macro\TPT@defaults{\wuhao}
}

\ifthu@degree@bachelor
  \newcommand{\thu@abstract@name}{中文摘要}
  \newcommand{\thu@abstract@name@en}{Abstract}
\else
  \newcommand{\thu@abstract@name}{摘\quad 要}
  \ifthu@language@chinese
    \newcommand{\thu@abstract@name@en}{Abstract}
  \else
    % 仅仅英文为主要语言的摘要需要大写
    \newcommand{\thu@abstract@name@en}{ABSTRACT}
  \fi
  %%%%%% 此处为南科大特色格式
  \renewcommand*{\thefigure}{\thechapter-\arabic{figure}}
  \renewcommand*{\thesubfigure}{\space\alph{subfigure})}
  \renewcommand*{\thetable}{\thechapter-\arabic{table}}
  \renewcommand*{\thesubtable}{\space\alph{subtable})}
\fi
\ctexset{%
  chapter = {
    nameformat   = {},
    numberformat = {},
    titleformat  = {},
    aftername    = \quad,
    fixskip      = true,
    afterindent  = true,
    lofskip      = 0pt,
    lotskip      = 0pt,
  },
  section = {
    aftername    = \quad,
    afterindent  = true,
  },
  subsection = {
    aftername    = \quad,
    afterindent  = true,
  },
  subsubsection = {
    aftername    = \quad,
    afterindent  = true,
  },
  paragraph/afterindent = true,
  subparagraph/afterindent = true,
}
\newcommand\thu@set@section@format{%
  % \ifthu@degree@bachelor
  %   \ctexset{%
  %     chapter = {
  %       format     = \centering\sffamily\fontsize{15bp}{20bp}\selectfont,
  %       beforeskip = 30bp,
  %       afterskip  = 20bp,
  %     },
  %     section = {
  %       format     = \sffamily\fontsize{14bp}{18bp}\selectfont,
  %       beforeskip = 25bp,
  %       afterskip  = 12bp,
  %     },
  %     subsection = {
  %       format     = \sffamily\fontsize{13bp}{15bp}\selectfont,
  %       beforeskip = 12bp,
  %       afterskip  = 6bp,
  %     },
  %     subsubsection = {
  %       format     = \sffamily\fontsize{12bp}{14bp}\selectfont,
  %       beforeskip = 12bp,
  %       afterskip  = 6bp,
  %     },
  %   }%
  %   \ifthu@main@language@chinese
  %     \ctexset{chapter/number = \thechapter}%
  %   \else
  %     \ctexset{chapter/number = \thu@english@number{chapter}}%
  %   \fi
  % \else
    \ctexset{%
      chapter = {
        format     = \centering\sffamily\sanhao,
        beforeskip = 24bp,
        afterskip  = 18bp,
      },
      section = {
        format     = \sffamily\fontsize{14bp}{20bp}\selectfont,
        beforeskip = 24bp,
        afterskip  = 6bp,
      },
      subsection = {
        format     = \sffamily\fontsize{13bp}{20bp}\selectfont,
        beforeskip = 12bp,
        afterskip  = 6bp,
      },
      subsubsection = {
        format     = \sffamily\fontsize{12bp}{20bp}\selectfont,
        beforeskip = 12bp,
        afterskip  = 6bp,
      },
    }%
    \ifthu@main@language@english
      \ctexset{%
      chapter = {
        format     += \bfseries,
      },
      section = {
        format     += \bfseries,
      },
      subsection = {
        format     += \bfseries,
      },
      subsubsection = {
        format     += \bfseries,
      },
      }
    \fi
  % \fi

}
\thu@set@section@format
\thu@option@hook{degree}{\thu@set@section@format}
\newcommand\thu@english@number[1]{%
  \expandafter\ifcase\csname c@#1\endcsname
    Zero\or
    One\or
    Two\or
    Three\or
    Four\or
    Five\or
    Six\or
    Seven\or
    Eight\or
    Nine\or
    Ten\or
    Eleven\or
    Twelve\or
    Thirteen\or
    Fourteen\or
    Fifteen\or
    Sixteen\or
    Seventeen\or
    Eighteen\or
    Nineteen\or
    Twenty\or
    \thu@error{You are genius}%
  \fi
}
\newcommand\thu@pdfbookmark[2]{}
\newcommand\thu@phantomsection{}
\NewDocumentCommand\thu@chapter{s o m o}{%
  \IfBooleanF{#1}{%
    \thu@error{You have to use the star form: \string\thu@chapter*}%
  }%
  \if@openright\cleardoublepage\else\clearpage\fi%
  \IfValueTF{#2}{%
    \ifthenelse{\equal{#2}{}}{%
      \thu@pdfbookmark{0}{#3}%
    }{%
      \thu@phantomsection
      \addcontentsline{toc}{chapter}{#2}%
    }%
  }{%
    \thu@phantomsection
    \addcontentsline{toc}{chapter}{#3}%
  }%
  \ifthu@degree@bachelor\ctexset{chapter/beforeskip=40bp}\fi
  \chapter*{#3}%
  \ifthu@degree@bachelor\ctexset{chapter/beforeskip=30bp}\fi
  \IfValueTF{#4}{%
    \ifthenelse{\equal{#4}{}}{%
      \@mkboth{}{}%
    }{%
      \@mkboth{#4}{#4}%
    }%
  }{%
    \@mkboth{#3}{#3}%
  }%
}
\setcounter{secnumdepth}{3}
\setcounter{tocdepth}{2}
\renewcommand\tableofcontents{%
  % \ifthu@degree@graduate
  %   \thu@chapter*{\contentsname}%
  % \else
    \thu@chapter*[]{\contentsname}%
  % \fi
  \@starttoc{toc}%
}
\thu@define@key{
  toc-chapter-style = {
    name = toc@chapter@style,
    choices = {
      arial,
      times,
    },
    default = arial,
  },
}
\newcommand\thu@leaders{\titlerule*[4bp]{.}}
\newcommand\thu@set@toc@format{%
  \contentsmargin{\z@}%
  \ifthu@degree@bachelor
    \ifthu@main@language@chinese
      \titlecontents{chapter}
        [\z@]{\addvspace{6bp}
          \ifthu@toc@chapter@style@arial
            \sffamily
          \else
            \heiti
          \fi
        }
        {\contentspush{\thecontentslabel\quad}}{}
        {\rmfamily\thu@leaders\thecontentspage}%
      \titlecontents{section}
        [1em]{}
        {\contentspush{\thecontentslabel\quad}}{}
        {\thu@leaders\thecontentspage}%
      \titlecontents{subsection}
        [1.5em]{}
        {\contentspush{\thecontentslabel\quad}}{}
        {\thu@leaders\thecontentspage}%
    \else
      \ifthu@main@language@english
        \titlecontents{chapter}
          [\z@]{\addvspace{6bp}\sffamily}
          {\contentspush{\thecontentslabel\quad}}{}
          {\rmfamily\thu@leaders\thecontentspage}%
        \titlecontents{section}
          [0.5cm]{}
          {\contentspush{\thecontentslabel\quad}}{}
          {\thu@leaders\thecontentspage}%
        \titlecontents{subsection}
          [1cm]{}
          {\contentspush{\thecontentslabel\quad}}{}
          {\thu@leaders\thecontentspage}%
      \fi
    \fi
  \else
    \titlecontents{chapter}
      [\z@]{\addvspace{6bp}\sffamily}
      {\contentspush{\thecontentslabel\quad}}{}
      {\rmfamily\thu@leaders\thecontentspage}%
    \titlecontents{section}
      [1em]{}
      {\contentspush{\thecontentslabel\quad}}{}
      {\thu@leaders\thecontentspage}%
    \titlecontents{subsection}
      [2em]{}
      {\contentspush{\thecontentslabel\quad}}{}
      {\thu@leaders\thecontentspage}%
  \fi
}
\thu@set@toc@format
\thu@option@hook{degree}{\thu@set@toc@format}
\thu@define@key{
  secret-level = {
    name = secret@level,
  },
  secret-year = {
    name = secret@year,
  },
  title = {
    default = {标题},
  },
  title* = {
    default = {Title},
    name    = title@en,
  },
  author = {
    default = {姓名},
  },
  author* = {
    default = {Name of author},
    name    = author@en,
  },
  supervisor = {
    default = {导师姓名},
  },
  supervisor* = {
    default = {Name of supervisor},
    name    = supervisor@en,
  },
  associate-supervisor = {
    name = associate@supervisor,
  },
  associate-supervisor* = {
    name = associate@supervisor@en,
  },
  joint-supervisor = {
    name = joint@supervisor,
  },
  joint-supervisor* = {
    name = joint@supervisor@en,
  },
  degree-domain = {
    default = {工学},
    name    = degree@domain,
  },
  degree-domain* = {
    default = {Engineering},
    name    = degree@domain@en,
  },
  gongsuo = {
    default = false,
    choices = {
      false,
      true,
    },
    name    = gongsuo,
  },
  department = {
    default = {计算机科学与技术系},
  },
  department* = {
    default = {Computer Science and Technology},
    name    = department@en,
  },
  discipline = {
    % default = {计算机科学与技术},
  },
  discipline* = {
    % default = {Computer Science and Technology},
    name    = discipline@en,
  },
  date = {
    default = {\the\year-\two@digits{\month}-\two@digits{\day}},
  },
  defense-date = {
    name    = defense@date,
    default = {\the\year-\two@digits{\month}-\two@digits{\day}},
  },
  clc,
  udc,
  id,
  discipline-level-1 = {
    default = {一级学科名称},
    name    = discipline@level@i,
  },
  discipline-level-2 = {
    default = {二级学科名称},
    name    = discipline@level@ii,
  },
  start-date = {
    name    = start@date,
    default = {\the\year-\two@digits{\month}-\two@digits{\day}},
  },
  end-date = {
    name    = end@date,
    default = {\the\year-\two@digits{\month}-\two@digits{\day}},
  },
  include-spine = {
    name = include@spine,
    choices = {
      false,
      true,
    },
    default = false,
  },
  statesecrets = {
    name = statesecrets,
  },
  natclassifiedindex = {
    name = natclassifiedindex,
  },
  intclassifiedindex = {
    name = intclassifiedindex,
  },
}
\newcommand\thu@format@date[2]{%
  \edef\thu@@date{#2}%
  \def\thu@@process@date##1-##2-##3\@nil{%
    #1{##1}{##2}{##3}%
  }%
  \expandafter\thu@@process@date\thu@@date\@nil
}
\newcommand\thu@date@zh@digit[3]{#1 年 \number#2 月 \number#3 日}
\newcommand\thu@date@zh@digit@short[3]{#1 年 \number#2 月}
\newcommand\thu@date@zh@short[3]{\zhdigits{#1}年\zhnumber{#2}月}
\newcommand\thu@date@month[1]{%
  \ifcase\number#1\or
    January\or February\or March\or April\or May\or June\or
    July\or August\or September\or October\or November\or December%
  \fi
}
\newcommand\thu@date@en@short[3]{\thu@date@month{#2}, #1}
\newcommand\thu@underline[2][6em]{\hskip1pt\underline{\hb@xt@ #1{\hss#2\hss}}\hskip3pt}
\newcommand\thu@CJKunderline[2][6em]{\CJKunderline*{\hb@xt@ #1{\hss#2\hss}}}
\newcommand\thu@fixed@box[2]{%
  \begingroup
    \def\CJKglue{\hskip 0pt plus 2filll minus 1filll}%
    \makebox[#1][l]{#2}%
  \endgroup
}
\newbox\thu@stretch@box
\newcommand\thu@stretch[2]{%
  \sbox\thu@stretch@box{#2}%
  \ifdim \wd\thu@stretch@box < #1\relax
    \begingroup
      \def\CJKglue{\hskip 0pt plus 2filll}%
      \makebox[#1][l]{#2}%
    \endgroup
  \else
    \box\thu@stretch@box
  \fi
}
\newbox\thu@pad@box
\newcommand\thu@pad[2]{%
  \sbox\thu@pad@box{#2}%
  \ifdim \wd\thu@pad@box < #1\relax
    \makebox[#1][l]{\box\thu@pad@box}%
  \else
    \box\thu@pad@box
  \fi
}
\newcounter{thu@csl@count}
\newcommand\thu@name@title@process[1]{%
  \ifcase\c@thu@csl@count  % == 0
    \gdef\thu@@name{#1}%
  \or  % == 1
    \gdef\thu@@title{#1}%
  \fi
  \stepcounter{thu@csl@count}%
}
\newcommand\thu@name@title@format[2]{%
  \thu@pad{3cm}{\thu@stretch{4em}{#1}}%
  \thu@stretch{3em}{#2}%
}
\newcommand\thu@name@title[1]{%
  \setcounter{thu@csl@count}{0}%
  \gdef\thu@@name{}%
  \gdef\thu@@title{}%
  \expandafter\comma@parse\expandafter{#1}{\thu@name@title@process}%
  \thu@name@title@format{\thu@@name}{\thu@@title}%
}
\renewcommand\maketitle{%
  \thu@coverpage
  \cleardoublepage
  \pagenumbering{Alph}%
  \thu@pdfbookmark{-1}{\thu@title}%
  \thu@titlepage
  % \ifthu@include@spine@true
  %   \thu@spine
  % \fi
  \ifthu@degree@graduate
    \cleardoublepage
    \thu@titlepage@en
  \fi
  \clearpage
}

\newcommand\thu@coverpage{%
  \newgeometry{
    top     = 5cm,
    bottom  = 3cm,
    hmargin = 3cm,
  }%
  \thispagestyle{empty}%
  \begin{center}
    {\fzxbiaosong \fontsize{24bp}{31.2bp} \textbf{\degree@level 学位论文}}
    \vspace{2cm}

    % 24 bp*1.3默认行距比例*1.25行距 = 39
    {\fontsize{24bp}{39bp} \rmfamily \siyuanheiti \thu@title \\}
    \vspace{1em}

    % 18 bp*1.3默认行距比例*1.25行距 = 29.25
    {\fontsize{18bp}{29.25bp}\selectfont \textbf{\thu@title@en \\} }
    \vfill

      {\fontsize{18bp}{23.4bp} \siyuansongti@en \siyuansongti %
      \renewcommand\arraystretch{1.25}
      \begin{tabular}{@{}r@{：}l@{}}
        \makebox[6em][s]{研究生} & \thu@author\\
        \makebox[6em][s]{指导教师} & \thu@supervisor\\
      \end{tabular}}

    \vspace{2cm}
    {\fontsize{18bp}{23.4bp} \siyuansongti@en \siyuansongti \thu@titlepage@date@sustech}
  \end{center}
}
\newcommand\thu@titlepage{%
  % \thusetup{language = chinese}%
  % \ifthu@degree@graduate
  %   \ifthu@degree@type@academic
  %     \thu@titlepage@graduate@academic
  %   \else
  %     \ifx\thu@discipline\@empty
  %       \thu@titlepage@graduate@professional
  %     \else
  %       \thu@titlepage@graduate@academic
  %     \fi
  %   \fi
  % \else
  %   \ifthu@degree@bachelor
  %     \thu@titlepage@bachelor
  %   \else
  %     \ifthu@degree@postdoc
  %       \thu@cover@postdoc
  %       \cleardoublepage
  %       \thu@titlepage@postdoc
  %     \fi
  %   \fi
  % \fi
  % \thu@reset@main@language
  \thu@titlepage@graduate@sustech
}
\def\thu@schoolid{14325}
\def\flagtrue{true}
\def\zhuanye{%
  \ifx\flagtrue\thu@gongsuo%
    工程领域%
  \else%
    学科专业%
  \fi%
}
\def\zhuanye@en{%
  \ifx\flagtrue\thu@gongsuo Engineering Field%
  \else%
  Speciality%
  \fi%
}
\def\degree@level{%
  \ifthu@degree@master%
    硕士%
  \else%
    博士%
  \fi%
}
\def\degree@level@en@adj{%
  \ifthu@degree@master%
    Master%
  \else%
    Doctoral%
  \fi%
}
\def\degree@level@en@noun{%
  \ifthu@degree@master%
    Master%
  \else%
    Doctor%
  \fi%
}
\def\thu@subject{\thu@degree@domain \degree@level 学位论文}
\def\thu@subject@en{%
\ifx\flagtrue\thu@gongsuo%
Thesis for the professional degree of \degree@level@en@noun \ of \thu@degree@domain@en%
\else%
Thesis for the degree of \degree@level@en@noun \ of \thu@degree@domain@en%
\fi%
}
\newcommand\thu@titlepage@graduate@sustech{%
  \newgeometry{
    top     = 3cm,
    bottom  = 3cm,
    hmargin = 3cm,
  }%
  \thispagestyle{empty}%
  \begin{center}
    {\songti \xiaosi
    \renewcommand\arraystretch{1.25}
    \begin{tabular}{@{}r@{：}l@{}}
      国内图书分类号 & \thu@natclassifiedindex\\
      国际图书分类号 & \thu@intclassifiedindex
    \end{tabular}\hfill
    \begin{tabular}{@{}r@{：}l@{}}
      学校代码 & \thu@schoolid\\
      密级 & \thu@statesecrets
    \end{tabular}}

    \vspace{3.5cm}
    {\songti \xiaoer \textbf{\thu@subject}}

    \vspace{1.5cm}
    % 24 bp*1.3默认行距比例*1.25行距 = 39
    {\fontsize{24bp}{39bp}\selectfont \heiti \thu@title \\}

    \vfill
      {\sihao%
      \renewcommand\arraystretch{1.5}
      \begin{tabular}{@{}r@{：}l@{}}
        \makebox[6em][s]{\heiti {\degree@level 研究生}} & \thu@author\\
        \makebox[6em][s]{\heiti {指导教师}} & \thu@supervisor\\
        \makebox[6em][s]{\heiti {申请学位}} & \thu@degree@domain \degree@level\\
        \makebox[6em][s]{\heiti {\zhuanye}} & \thu@discipline\\
        \makebox[6em][s]{\heiti {答辩日期}} & \thu@format@date{\thu@date@zh@digit@short}{\thu@defense@date}\\
        \makebox[6em][s]{\heiti {培养单位}} & \thu@department\\
        \makebox[6em][s]{\heiti {学位授予单位}} & 南方科技大学
      \end{tabular}}
    \vspace{1.5cm}

  \end{center}

  \clearpage
  \restoregeometry
}

\def\thu@info@item@sustech#1#2{%
  \textbf{#1} & %
  {
    \renewcommand\arraystretch{1.15}%
    \begin{tabular}{@{}l@{}}#2\end{tabular}%
  }
}%

\newcommand\thu@titlepage@graduate@sustech@en{%
  \newgeometry{
    top     = 3cm,
    bottom  = 3cm,
    hmargin = 3cm,
  }%
  \thispagestyle{empty}%
  {\noindent \xiaosi
    \renewcommand\arraystretch{1.25}
    \begin{tabular}{@{}l@{}}
      Classified Index: \thu@natclassifiedindex\\
      U.D.C: \thu@intclassifiedindex
    \end{tabular}}

  \begin{center}

    \vspace{3.5cm}
    \mbox{\xiaoer \thu@subject@en}

    \vspace{1.5cm}
    \parbox[t]{30em}{
      \centering
      % 24 bp*1.15默认行距比例*1.25行距 = 34.5
      {\fontsize{24bp}{34.5bp}\selectfont \textbf{\thu@title@en \\}}
      }
    \par

    \vfill
      {\sihao%
      \renewcommand\arraystretch{1.3}
      % 手动调整使得视觉接近
      \begin{tabular}{@{}m{0.44\textwidth}m{0.44\textwidth}@{}}
        \thu@info@item@sustech{Candidate:}{\thu@author@en}\\
        \thu@info@item@sustech{Supervisor:}{\thu@supervisor@en}\\
        \thu@info@item@sustech{Academic Degree Applied for:}{\degree@level@en@noun \ of \thu@degree@domain@en}\\
        \thu@info@item@sustech{\zhuanye@en:}{\thu@discipline@en}\\
        \thu@info@item@sustech{Date of Defence:}{\thu@format@date{\thu@date@en@short}{\thu@defense@date}}\\
        \thu@info@item@sustech{Affiliation:}{\thu@department@en}\\
        \thu@info@item@sustech{Degree-Conferring-Institution:}{Southern University of Science\\and Technology}
      \end{tabular}}
    \vspace{1.5cm}

  \end{center}

  \clearpage
  \restoregeometry
}
\newcommand\thu@titlepage@graduate@professional{%
  \newgeometry{
    top     = 2cm,
    bottom  = 6cm,
    hmargin = 3.5cm,
  }%
  \thispagestyle{empty}%
  \null\vskip 0.45cm%
  \begingroup
    \centering
    \parbox[t][1.52cm][t]{\textwidth}{%
      \hskip -0.69cm%
      \thu@titlepage@secret
    }\par
    \vskip 1.5cm%
    {\sffamily\yihao[1.575]\thu@title\par}%
    \vskip 0.9cm%
    \thu@titlepage@degree
    \vfill
    \parbox[t][5.28cm][t]{\textwidth}{\centering\thu@titlepage@info}\par
    \parbox[t][1.25cm][t]{\textwidth}{\centering\thu@titlepage@date}\par
  \endgroup
  \clearpage
  \restoregeometry
}
\newcommand\thu@titlepage@secret{%
  \sffamily\sanhao
  \ifx\thu@secret@level\@empty
    \phantom{秘密}%
  \else
    \thu@secret@level★\makebox[3em][c]{\thu@secret@year}年%
  \fi\par
}
\newcommand\thu@titlepage@title{%
  \sffamily\yihao[1.8]\thu@title\par
}
\newcommand\thu@titlepage@degree{%
  \begingroup
    \def\CJKglue{\hskip 1bp}%
    \CJKfamily+{}\xiaoer
    (申请清华大学\thu@degree@name\ifthu@degree@type@professional 专业\fi 学位论文)\par
  \endgroup
}
\newcommand\thu@titlepage@info{%
  \ifthu@degree@doctor
    \ifthu@degree@type@academic
      \thu@titlepage@info@doctor@academic
    \else
      \thu@titlepage@info@doctor@professional
    \fi
  \else
    \ifthu@degree@type@academic
      \thu@titlepage@info@master@academic
    \else
      \ifx\thu@discipline\@empty
        \thu@titlepage@info@master@other
      \else
        \thu@titlepage@info@master@engineer
      \fi
    \fi
  \fi
}
\newcommand\thu@titlepage@info@tabular[4]{%
  \def\thu@info@item##1##2##3{%
    \ifx##3\@empty\else
      \thu@pad{#1}{\thu@fixed@box{#2}{##1}}%
      \thu@pad{#3}{：}%
      ##2{##3}\\
    \fi
  }%
  \fangsong\sanhao[1.95]%
  \begin{tabular}{l}%
    #4%
  \end{tabular}%
}
\newcommand\thu@titlepage@info@doctor@academic{%
  \thu@titlepage@info@tabular{2.8cm}{2.8cm}{0.82cm}{%
    \thu@info@item{培养单位}{}{\thu@department}%
    \thu@info@item{学科}{}{\thu@discipline}%
    \thu@info@item{研究生}{\thu@name@title}{\thu@author}%
    \thu@info@item{指导教师}{\thu@name@title}{\thu@supervisor}%
    \thu@info@item{副指导教师}{\thu@name@title}{\thu@associate@supervisor}%
    \thu@info@item{联合导师}{\thu@name@title}{\thu@joint@supervisor}%
  }\par
}
\newcommand\thu@titlepage@info@doctor@professional{%
  \thu@titlepage@info@tabular{3.03cm}{5em}{1.52cm}{%
    \thu@info@item{培养单位}{}{\thu@department}%
    \thu@info@item{申请人}{\thu@name@title}{\thu@author}%
    \thu@info@item{指导教师}{\thu@name@title}{\thu@supervisor}%
    \thu@info@item{副指导教师}{\thu@name@title}{\thu@associate@supervisor}%
    \thu@info@item{联合导师}{\thu@name@title}{\thu@joint@supervisor}%
  }\par
}
\newcommand\thu@titlepage@info@master@academic{%
  \thu@titlepage@info@tabular{3.59cm}{5.5em}{0.82cm}{%
    \thu@info@item{培养单位}{}{\thu@department}%
    \thu@info@item{学科}{}{\thu@discipline}%
    \thu@info@item{研究生}{\thu@name@title}{\thu@author}%
    \thu@info@item{指导教师}{\thu@name@title}{\thu@supervisor}%
    \thu@info@item{副指导教师}{\thu@name@title}{\thu@associate@supervisor}%
    \thu@info@item{联合指导教师}{\thu@name@title}{\thu@joint@supervisor}%
  }\par
}
\newcommand\thu@titlepage@info@master@engineer{%
  \thu@titlepage@info@tabular{2.8cm}{2.8cm}{1.34cm}{%
    \thu@info@item{培养单位}{}{\thu@department}%
    \thu@info@item{工程领域}{}{\thu@discipline}%
    \thu@info@item{申请人}{\thu@name@title}{\thu@author}%
    \thu@info@item{指导教师}{\thu@name@title}{\thu@supervisor}%
    \thu@info@item{副指导教师}{\thu@name@title}{\thu@associate@supervisor}%
    \thu@info@item{联合指导教师}{\thu@name@title}{\thu@joint@supervisor}%
  }\par
}
\newcommand\thu@titlepage@info@master@other{%
  \thu@titlepage@info@tabular{3.28cm}{5em}{1.52cm}{%
    \thu@info@item{培养单位}{}{\thu@department}%
    \thu@info@item{申请人}{\thu@name@title}{\thu@author}%
    \thu@info@item{指导教师}{\thu@name@title}{\thu@supervisor}%
    \thu@info@item{副指导教师}{\thu@name@title}{\thu@associate@supervisor}%
    \thu@info@item{联合指导教师}{\thu@name@title}{\thu@joint@supervisor}%
  }\par
}
\newcommand\thu@titlepage@date@sustech{%
  \begingroup
    \def\CJKglue{\hskip 1bp}%
    \thu@format@date{\thu@date@zh@short}{\thu@date}\par
  \endgroup
}
\newcommand\thu@titlepage@date{%
  \begingroup
    \def\CJKglue{\hskip 1bp}%
    \sanhao\thu@format@date{\thu@date@zh@short}{\thu@date}\par
  \endgroup
}
\newcommand{\thu@titlepage@en}{%
  % \newgeometry{
  %   top     = 5.5cm,
  %   bottom  = 5cm,
  %   hmargin = 3.6cm,
  % }%
  % \thispagestyle{empty}%
  % \thusetup{language = english}%
  % \ifthu@degree@type@academic
  %   \thu@titlepage@en@graduate@academic
  % \else
  %   \thu@titlepage@en@graduate@professional
  % \fi
  \thu@titlepage@graduate@sustech@en
  \thu@reset@main@language
  \clearpage
  \restoregeometry
}
\newcommand\thu@titlepage@en@graduate@academic{%
  \begingroup
    \centering
    \null\vskip -0.7cm%
    \thu@titlepage@en@title
    \vfill
    \sanhao[1.725]%
    \thu@titlepage@en@degree
    \vskip 0.13cm%
    in\par
    \vskip 0.1cm%
    {\bfseries\sffamily\thu@discipline@en\par}
    \vskip 0.7cm%
    {\sffamily by\par}
    \vskip 0.24cm%
    {\sffamily\bfseries\thu@author@en\par}%
    \vskip 0.14cm%
    \parbox[t][3.07cm][t]{\textwidth}{%
      \centering\xiaosan[2.1]%
      \thu@titlepage@en@supervisor
    }\par
    \thu@titlepage@en@date
    \vskip 0.65cm%
  \endgroup
}
\newcommand\thu@titlepage@en@graduate@professional{%
  \begingroup
    \centering
    \null\vskip -0.7cm%
    \thu@titlepage@en@title
    \vfill
    \sanhao[1.725]%
    \thu@titlepage@en@degree
    \vskip 1.1cm%
    {\sffamily by\par}
    \vskip 0.24cm%
    {\sffamily\bfseries\thu@author@en\par}%
    \ifx\thu@discipline@en\empty
      \vskip 1.95cm%
    \else
      \vskip -0.1cm%
      {\sffamily\bfseries(\thu@discipline@en)\par}%
      \vskip 1.1cm%
    \fi
    \parbox[t][3.37cm][t]{\textwidth}{%
      \centering\xiaosan[1.82]%
      \thu@titlepage@en@supervisor
    }\par
    \thu@titlepage@en@date
    \vskip 0.3cm%
  \endgroup
}
\newcommand\thu@titlepage@en@title{%
  \begingroup
    \sffamily\bfseries\fontsize{20bp}{31bp}\selectfont
    \thu@title@en\par
  \endgroup
}
\newcommand\thu@thesis@name@en{%
  \ifthu@degree@master
    Thesis%
  \else
    Dissertation%
  \fi
}
\newcommand\thu@titlepage@en@degree{%
  \thu@thesis@name@en{} Submitted to\par
  {\bfseries Tsinghua University\par}%
  in partial fulfillment of the requirement\par
  for the
  \ifthu@degree@type@professional
    professional
  \fi
  degree of\par
  {\sffamily\bfseries\thu@degree@name@en\par}%
}
\newcommand\thu@titlepage@en@supervisor{%
  \begin{tabular}{r@{\makebox[0.71cm][l]{:}}l}%
    \thu@thesis@name@en{} Supervisor & \thu@supervisor@en     \\
    \ifx\thu@associate@supervisor@en\@empty\else
      Associate Supervisor            & \thu@associate@supervisor@en \\
    \fi
    \ifx\thu@joint@supervisor@en\@empty\else
      Cooperate Supervisor            & \thu@joint@supervisor@en   \\
    \fi
  \end{tabular}%
}
\newcommand\thu@titlepage@en@date{%
  \begingroup
    \sffamily\bfseries\sanhao
    \thu@format@date{\thu@date@en@short}{\thu@date}\par
  \endgroup
}
\newcommand\thu@titlepage@bachelor{%
  \newgeometry{
    vmargin = 2.54cm,
    hmargin = 3.17cm,
  }%
  \thispagestyle{empty}%
  \begingroup
    \centering
    \parbox[t][0cm][t]{\textwidth}{%
      \hfill
      \xiaosi
      \ifx\thu@secret@level\@empty\else
        \thu@secret@level\space\thu@secret@year 年\par
      \fi
    }%
  \endgroup
  \vfill
  \begingroup
    \centering
    \includegraphics{tsinghua-name-bachelor.pdf}%
    \vskip 0.94cm%
    {\sffamily\bfseries\xiaochu\ziju{0.5}综合论文训练\par}%
  \endgroup
  \vskip 1.8cm%
  \begingroup
    \heiti
    \ifthu@main@language@chinese
      \yihao[1.56]%
    \else
      \fontsize{26bp}{32bp}\selectfont
    \fi
    \parindent=18bp%
    \hangindent=72bp%
    \makebox[54bp]{\xiaoer[1.2]题目：}%
    \CJKunderline*[skip=false, thickness=0.05em, depth=0.12em]{\thu@title}%
    \ifthu@main@language@english
      \\
      \thusetup{language=english}%
      \ul\thu@title@en
      \thusetup{language=chinese}%
    \fi
    \par
  \endgroup
  \vskip 1.9cm%
  \begingroup
    \fangsong\sanhao[2.32]%
    \leftskip=2.5cm%
    \parindent=\z@
    \def\thu@info@item##1##2##3{%
      \ifx##3\@empty\else
        \thu@fixed@box{%
          \ifx\thu@joint@supervisor\@empty
            4em%
          \else
            5.5em%
          \fi
        }{##1}：##2{##3}\par
      \fi
    }%
    \def\thu@name@title@format##1##2{%
      \thu@stretch{3em}{##1}\quad ##2%
    }%
    \thu@info@item{系别}{}{\thu@department}%
    \thu@info@item{专业}{}{\thu@discipline}%
    \thu@info@item{姓名}{\thu@name@title}{\thu@author}%
    \thu@info@item{指导教师}{\thu@name@title}{\thu@supervisor}%
    \thu@info@item{辅导教师}{\thu@name@title}{\thu@associate@supervisor}%
    \thu@info@item{联合指导教师}{\thu@name@title}{\thu@joint@supervisor}%
  \endgroup
  \vskip 1.4cm%
  \begingroup
    \centering
    {\CJKfamily+{}\xiaosi\thu@format@date{\thu@date@zh@digit}{\thu@date}\par}%
  \endgroup
  \vfill
  \clearpage
  \restoregeometry
}
\newcommand\thu@cover@postdoc{%
  \thispagestyle{empty}%
  \begin{center}%
    \renewcommand\ULthickness{0.7pt}%
    \vspace*{0.35cm}%
    {\sihao[2.6]%
      \thu@stretch{3.1em}{分类号}\thu@underline[3.7cm]{\thu@clc}\hfill
      密级\thu@underline[3.7cm]{\thu@secret@level}\par
      \thu@stretch{3.1em}{U D C}\thu@underline[3.7cm]{\thu@udc}\hfill
      编号\thu@underline[3.7cm]{\thu@id}\par
    }%
    \vskip 3.15cm%
    {\sffamily\bfseries\xiaoer[2.6]%
      {\ziju{1.5}清华大学\par}%
      {\ziju{0.5}博士后研究工作报告\par}%
    }%
    \vskip 0.2cm%
    \parbox[t][4.0cm][c]{\textwidth}{%
      \centering\sihao[3.46]\CJKunderline*[depth=1em]{\thu@title}\par
    }\par
    \vskip 0.4cm%
    {\xiaosi\thu@author\par}%
    \vskip 1.4cm%
    {\xiaosi[1.58]\xeCJKsetup{underline/depth=0.9em}%
      工作完成日期\quad
      \thu@CJKunderline[5.9cm]{%
        \thu@format@date{\thu@date@zh@digit@short}{\thu@start@date}—%
        \thu@format@date{\thu@date@zh@digit@short}{\thu@end@date}
      }\par
      \vskip 0.55cm%
      报告提交日期\quad
      \thu@CJKunderline[5.9cm]{\thu@format@date{\thu@date@zh@digit@short}{\thu@date}}\par
    }%
    \vskip 0.45cm%
    {\xiaosi[2]{\ziju{1}清华大学}\quad （北京）\par}%
    \vskip 0.25cm%
    {\xiaosi[2]\thu@format@date{\thu@date@zh@digit@short}{\thu@date}\par}%
  \end{center}%
}
\newcommand\thu@titlepage@postdoc{%
  \thispagestyle{empty}%
  \begin{center}%
    \vspace*{1.5cm}%
    \parbox[t][3cm][c]{\textwidth}{%
      \centering\sanhao[1.95]\thu@title\par
    }\par
    \vskip 0.15cm%
    \parbox[t][3cm][c]{\textwidth}{%
      \centering\sihao[1.36]\thu@title@en\par
    }\par
    \vskip 0.4cm%
    {\xiaosi[2.6]%
      \begin{tabular}{l@{\quad}l}%
        \thu@stretch{11em}{博士后姓名}                  & \thu@author           \\
        \thu@stretch{11em}{流动站（一级学科）名称}      & \thu@discipline@level@i  \\
        \thu@stretch{11em}{专\quad{}业（二级学科）名称} & \thu@discipline@level@ii \\
      \end{tabular}\par
    }%
    \vskip 2.7cm%
    {\xiaosi[2.6]%
      研究工作起始时间\quad\thu@format@date{\thu@date@zh@digit}{\thu@start@date}\par
      \vskip 0.1cm%
      研究工作期满时间\quad\thu@format@date{\thu@date@zh@digit}{\thu@end@date}\par
    }%
    \vskip 2.1cm%
    {\xiaosi[2.6]清华大学人事部（北京）\par}%
    \vskip 0.6cm%
    {\wuhao\thu@format@date{\thu@date@zh@digit@short}{\thu@date}\par}%
  \end{center}%
}
\def\thu@committee@name{学位论文指导小组、公开评阅人和答辩委员会名单}
\newenvironment{committee}[1][]{%
  \cleardoublepage
  \let\thu@committee@file\@empty
  \kv@define@key{thu@committee}{name}{\let\thu@committee@name\kv@value}%
  \kv@define@key{thu@committee}{file}{\let\thu@committee@file\kv@value}%
  \kv@set@family@handler{thu@committee}{%
    \ifx\kv@value\relax
      \let\thu@committee@file\kv@key
    \else
      \kv@handled@false
    \fi
  }%
  \kvsetkeys{thu@committee}{#1}%
  \ifx\thu@committee@file\@empty
    \thu@chapter*[]{\thu@committee@name}%
  \else
    \thu@pdfbookmark{0}{\thu@committee@name}%
    \includepdf{\thu@committee@file}%
  \fi
  \thispagestyle{empty}%
  \ctexset{
    section = {
      format    += {\centering},
      numbering = false,
      afterindent = false,
    },
  }%
}{%
}
\newcommand\copyrightpage[1][]{%
  \ifthu@degree@postdoc\relax\else
    \def\thu@@tmp{#1}
    \ifx\thu@@tmp\@empty
      \ifthu@degree@bachelor
        \thu@copyright@page@bachelor
      \else
        \thu@copyright@page@graduate
      \fi
    \else
      \cleardoublepage
      \thispagestyle{empty}%
      \thu@pdfbookmark{0}{\thu@authorization@title}%
      \thu@phantomsection
      \kv@define@key{thu@copyright}{file}{\includepdf{\kv@value}}%
      \kv@set@family@handler{thu@copyright}{%
        \ifx\kv@value\relax
          \includepdf{\kv@key}%
        \else
          \kv@handled@false
        \fi
      }%
      \kvsetkeys{thu@copyright}{#1}%
    \fi
  \fi
}
\newcommand{\thu@authorization@frontdate}{%
  日\ifthu@degree@bachelor\hspace{1em}\else\hspace{2em}\fi 期：}
\newcommand\thu@copyright@page@graduate{%
  \cleardoublepage
  \newgeometry{
    vmargin = 3.8cm,
    hmargin = 3.2cm,
  }%
  \begingroup
    \ctexset{
      chapter = {
        format     = {\centering\sffamily\erhao},
        beforeskip = 18bp,
        afterskip  = 6bp,
      },
    }%
    \thu@chapter*[]{关于学位论文使用授权的说明}%
    \thispagestyle{empty}%
  \endgroup
  \vskip 50bp%
  \begingroup
    \fontsize{14bp}{26bp}\selectfont
    本人完全了解清华大学有关保留、使用学位论文的规定，即：\par
    清华大学拥有在著作权法规定范围内学位论文的使用权，其中包括：%
    （1）已获学位的研究生必须按学校规定提交学位论文，%
    学校可以采用影印、缩印或其他复制手段保存研究生上交的学位论文；%
    （2）\nobreak 为教学和科研目的，学校可以将公开的学位论文作为资料在图书馆、资料室等场所供校内师生阅读，%
    或在校园网上供校内师生浏览部分内容；%
    \ifthu@degree@doctor
      （3）根据《中华人民共和国学位条例暂行实施办法》及上级教育主管部门具体要求，向国家图书馆报送相应的学位论文。%
    \else
      （3）按照上级教育主管部门督导、抽查等要求，报送相应的学位论文。%
    \fi
    \par
    本人保证遵守上述规定。\par
    \vskip 6bp%
    \textbf{（保密的论文在解密后遵守此规定）}\par
  \endgroup
  \vskip1.2cm%
  \begingroup
    \noindent\xiaosi
    \hspace*{1.5cm}%
    作者签名：\thu@underline[7em]\relax\hfill
    导师签名：\thu@underline[7em]\relax\hspace*{1cm}\\[3pt]%
    \hspace*{1.5cm}%
    日\hspace{2em}期：\thu@underline[7em]\relax\hfill
    日\hspace{2em}期：\thu@underline[7em]\relax\hspace*{1cm}%
  \endgroup
  \clearpage
  \restoregeometry
}
\newcommand\thu@copyright@page@bachelor{%
  \cleardoublepage
  \begingroup
    \ctexset{
      chapter = {
        format     = {\centering\sffamily\erhao[1]},
        beforeskip = 1bp,
        afterskip  = 24bp,
      },
    }%
    \thu@chapter*[]{关于学位论文使用授权的说明}%
    \thispagestyle{empty}%
  \endgroup
  \vskip 4bp%
  本人完全了解清华大学有关保留、使用学位论文的规定，即：%
  学校有权保留学位论文的复印件，允许该论文被查阅和借阅；%
  学校可以公布该论文的全部或部分内容，可以采用影印、缩印或其他复制手段保存该论文。\par
  \textbf{(涉密的学位论文在解密后应遵守此规定)}\par
  \null\par
  \begingroup
    \centering
    签\quad 名：\thu@underline[6em]{}%
    导师签名：\thu@underline[6em]{}%
    日\quad 期\thu@underline[6em]{}%
    \par
  \endgroup
}
\thu@define@key{
  keywords,
  keywords* = {
    name = keywords@en,
  },
}
\newcommand\thu@clist@use[2]{%
  \def\thu@@tmp{}%
  \def\thu@clist@processor##1{%
    \ifx\thu@@tmp\@empty
      \def\thu@@tmp{#2}%
    \else
      #2%
    \fi
    ##1%
  }%
  \expandafter\comma@parse\expandafter{#1}{\thu@clist@processor}%
}
\newenvironment{abstract}{%
  \ifthu@degree@bachelor
    \cleardoublepage
  \fi
  \thusetup{language = chinese}%
  \ifthu@degree@graduate
    \thu@chapter*{\thu@abstract@name}%
  \else
    \thu@chapter*[]{\thu@abstract@name}%
  \fi
}{%
  \par
  \null\par
  \ifthu@degree@graduate
    \noindent
    % leftmargin 4 个字符的宽度
    \begin{description}[font=\normalfont,labelsep=0pt,leftmargin=4em]
      \item[\textsf{关键词：}] \thu@clist@use{\thu@keywords}{；}%
    \end{description}
  \else
    \textbf{关键词：}%
    \thu@clist@use{\thu@keywords}{；}%
  \fi
  \ifthu@degree@bachelor
    \cleardoublepage
  \fi
  \thu@reset@main@language % switch back to main language
}
\newenvironment{abstract*}{%
  \ifthu@degree@bachelor
    \cleardoublepage
  \fi
  \thusetup{language = english}%
  \ifthu@degree@graduate
    \thu@chapter*{\thu@abstract@name@en}%
  \else
    \thu@chapter*[]{\thu@abstract@name@en}%
  \fi
}{%
  \par
  \null\par
  \ifthu@degree@graduate
    \noindent
  \fi
  % leftmargin 5 个字符的宽度 （10个英文字符）
  \begin{description}[font=\normalfont,labelsep=0pt,leftmargin=5em]
    \item[\textbf{Keywords:}\space] \thu@clist@use{\thu@keywords@en}{; }%
  \end{description}
  \ifthu@degree@graduate
    \vspace*{\stretch{1}}%
  \fi
  \ifthu@degree@bachelor
    \cleardoublepage
  \fi
  \thu@reset@main@language % switch back to main language
}
\newenvironment{denotation}[1][2.5cm]{%
  \ifthu@degree@bachelor
    \cleardoublepage
  \fi
  \ifthu@degree@graduate
    \thu@chapter*{\thu@denotation@name}%
  \else
    \thu@chapter*[]{\thu@denotation@name}%
  \fi
  \vskip-30bp\xiaosi[1.6]\begin{thu@denotation}[labelwidth=#1]
}{%
  \end{thu@denotation}
}
\newlist{thu@denotation}{description}{1}
\setlist[thu@denotation]{%
  nosep,
  font=\normalfont,
  align=left,
  leftmargin=!, % sum of the following 3 lengths
  labelindent=0pt,
  labelwidth=2.5cm,
  labelsep*=0.5cm,
  itemindent=0pt,
}
\newcommand{\thu@statement@text}{本人郑重声明：所呈交的学位论文，是本人在导师指导下
  ，独立进行研究工作所取得的成果。尽我所知，除文中已经注明引用的内容外，本学位论
  文的研究成果不包含任何他人享有著作权的内容。对本论文所涉及的研究工作做出贡献的
  其他个人和集体，均已在文中以明确方式标明。}
\newcommand{\thu@signature}{签\hspace{1em}名：}
\newcommand{\thu@backdate}{日\hspace{1em}期：}
\newenvironment{acknowledgements}{%
  \@mainmatterfalse
  \ifthu@degree@bachelor
    \cleardoublepage
  \fi
  \thu@chapter*{\thu@acknowledgements@name}%
}{%
  \ifthu@degree@bachelor
    \cleardoublepage
  \fi
}
\thu@define@key{
  statement-page-style = {
    name = statement@page@style,
    choices = {
      empty,
      plain,
    },
    default = empty,
  },
  statement-page-number = {
    name = statement@page@number,
    choices = {
      false,
      true,
    },
    default = false,
  },
}
\thu@option@hook{statement-page-number}{%
  \ifthu@statement@page@number@false
    \thusetup{statement-page-style=empty}%
  \else
    \thusetup{statement-page-style=plain}%
  \fi
  \thu@warning{%
    The "statement-page-number" option is deprecated.
    Use "page-style" option of \protect\statement command instead%
  }%
}
\newcommand\statement[1][]{%
  \@mainmatterfalse
  \ifthu@degree@bachelor
    \cleardoublepage
    \def\thu@statement@name{声\hspace{2em}明}%
  \else
    \def\thu@statement@name{声\hspace{1em}明}%
  \fi
  \let\thu@statement@file\@empty
  \kv@define@key{thu@statement}{page-style}{\thusetup{statement-page-style=##1}}%
  \kv@define@key{thu@statement}{file}{\let\thu@statement@file\kv@value}%
  \kv@set@family@handler{thu@statement}{%
    \ifx\kv@value\relax
      \let\thu@statement@file\kv@key
    \else
      \kv@handled@false
    \fi
  }%
  \kvsetkeys{thu@statement}{#1}%
  \ifx\thu@statement@file\@empty
    \thu@chapter*{\thu@statement@name}%
    \thispagestyle{\thu@statement@page@style}%
    \thu@statement@text\par
    \ifthu@degree@graduate
      \vskip 2cm%
    \else
      \null\par
    \fi
    {\hfill\thu@signature\thu@underline[2.5cm]\relax
      \thu@backdate\thu@underline[2.5cm]\relax}%
  \else
    \includepdf[pagecommand={%
      \markboth{\thu@statement@name}{}%
      \thu@phantomsection
      \addcontentsline{toc}{chapter}{\thu@statement@name}%
    }]{\thu@statement@file}%
  \fi
  \ifthu@degree@bachelor
    \cleardoublepage
  \fi
}
\let\acknowledgement\acknowledgements
\let\endacknowledgement\endacknowledgements
\def\thu@listof#1{% #1: float type
  \setcounter{tocdepth}{2} % restore tocdepth in case being modified
  \@ifstar
    {\thu@chapter*[]{\csname list#1name\endcsname}\@starttoc{\csname ext@#1\endcsname}}
    {\thu@chapter*{\csname list#1name\endcsname}\@starttoc{\csname ext@#1\endcsname}}%
}
\renewcommand\listoffigures{%
  \thu@listof{figure}%
}
\titlecontents{figure}
  [\z@]{}
  {\contentspush{\figurename~\thecontentslabel\quad}}{}
  {\nobreak\thu@leaders\nobreak\hfil\thecontentspage}
\renewcommand\listoftables{%
  \thu@listof{table}%
}
\titlecontents{table}
  [\z@]{}
  {\contentspush{\tablename~\thecontentslabel\quad}}{}
  {\thu@leaders\thecontentspage}
\newcommand\listoffiguresandtables{%
  \thu@chapter*{\thu@list@figure@table@name}%
  \@starttoc{lof}%
  \par
  \null\par
  \@starttoc{lot}%
}
\def\ext@equation{loe}
\def\equcaption#1{%
  \addcontentsline{\ext@equation}{equation}%
                  {\protect\numberline{#1}}}
\newcommand\listofequations{\thu@listof{equation}}
\titlecontents{equation}
  [0pt]{\addvspace{6bp}}
  {\thu@equation@name~\thecontentslabel}{}
  {\nobreak\thu@leaders\nobreak\thecontentspage}
\contentsuse{equation}{loe}
  \thu@define@key{
    cite-style = {
      name = cite@style,
      choices = {
        super,
        inline,
        author-year,
      }
    }
  }
\PassOptionsToPackage{compress}{natbib}
\AtEndOfPackageFile*{natbib}{
  \DeclareRobustCommand\inlinecite{\@inlinecite}
  \def\@inlinecite#1{\begingroup\let\@cite\NAT@citenum\citep{#1}\endgroup}
  \let\onlinecite\inlinecite
  \newcommand\bibstyle@super{%
    \bibpunct{[}{]}{,}{s}{,}{\textsuperscript{,}}}
  \newcommand\bibstyle@inline{%
    \bibpunct{[}{]}{,}{n}{,}{,}}
  \@namedef{bibstyle@author-year}{%
    \bibpunct{(}{)}{;}{a}{,}{,}}
  \thu@option@hook{cite-style}{\@nameuse{bibstyle@\thu@cite@style}}
  \@namedef{bibstyle@thuthesis-numeric}{\citestyle{super}}
  \@namedef{bibstyle@thuthesis-author-year}{\citestyle{author-year}}
  \@namedef{bibstyle@thuthesis-bachelor}{\citestyle{super}}
  \@namedef{bibstyle@thuthesis-inline}{\citestyle{inline}}
  \renewcommand\NAT@citesuper[3]{\ifNAT@swa
    \if*#2*\else#2\NAT@spacechar\fi
    % \unskip\kern\p@\textsuperscript{\NAT@@open#1\NAT@@close}%
    %  \if*#3*\else\NAT@spacechar#3\fi\else #1\fi\endgroup}
    \unskip\kern\p@\textsuperscript{\NAT@@open#1\NAT@@close\if*#3*\else#3\fi}%
    \else #1\fi\endgroup}
  \renewcommand\NAT@citenum%
      [3]{\ifNAT@swa\NAT@@open\if*#2*\else#2\NAT@spacechar\fi
          % #1\if*#3*\else\NAT@cmt#3\fi\NAT@@close\else#1\fi\endgroup}
          #1\NAT@@close\textsuperscript{\if*#3*\else#3\fi}\else#1\fi\endgroup}
  \def\NAT@citexnum[#1][#2]#3{%
    \NAT@reset@parser
    \NAT@sort@cites{#3}%
    \NAT@reset@citea
    \@cite{\def\NAT@num{-1}\let\NAT@last@yr\relax\let\NAT@nm\@empty
      \@for\@citeb:=\NAT@cite@list\do
      {\@safe@activestrue
      \edef\@citeb{\expandafter\@firstofone\@citeb\@empty}%
      \@safe@activesfalse
      \@ifundefined{b@\@citeb\@extra@b@citeb}{%
        {\reset@font\bfseries?}
          \NAT@citeundefined\PackageWarning{natbib}%
        {Citation `\@citeb' on page \thepage \space undefined}}%
      {\let\NAT@last@num\NAT@num\let\NAT@last@nm\NAT@nm
        \NAT@parse{\@citeb}%
        \ifNAT@longnames\@ifundefined{bv@\@citeb\@extra@b@citeb}{%
          \let\NAT@name=\NAT@all@names
          \global\@namedef{bv@\@citeb\@extra@b@citeb}{}}{}%
        \fi
        \ifNAT@full\let\NAT@nm\NAT@all@names\else
          \let\NAT@nm\NAT@name\fi
        \ifNAT@swa
        \@ifnum{\NAT@ctype>\@ne}{%
          \@citea
          \NAT@hyper@{\@ifnum{\NAT@ctype=\tw@}{\NAT@test{\NAT@ctype}}{\NAT@alias}}%
        }{%
          \@ifnum{\NAT@cmprs>\z@}{%
          \NAT@ifcat@num\NAT@num
            {\let\NAT@nm=\NAT@num}%
            {\def\NAT@nm{-2}}%
          \NAT@ifcat@num\NAT@last@num
            {\@tempcnta=\NAT@last@num\relax}%
            {\@tempcnta\m@ne}%
          \@ifnum{\NAT@nm=\@tempcnta}{%
            \@ifnum{\NAT@merge>\@ne}{}{\NAT@last@yr@mbox}%
          }{%
            \advance\@tempcnta by\@ne
            \@ifnum{\NAT@nm=\@tempcnta}{%
              % \ifx\NAT@last@yr\relax
              %   \def@NAT@last@yr{\@citea}%
              % \else
              %   \def@NAT@last@yr{--\NAT@penalty}%
              % \fi
              \def@NAT@last@yr{-\NAT@penalty}%
            }{%
              \NAT@last@yr@mbox
            }%
          }%
          }{%
          \@tempswatrue
          \@ifnum{\NAT@merge>\@ne}{\@ifnum{\NAT@last@num=\NAT@num\relax}{\@tempswafalse}{}}{}%
          \if@tempswa\NAT@citea@mbox\fi
          }%
        }%
        \NAT@def@citea
        \else
          \ifcase\NAT@ctype
            \ifx\NAT@last@nm\NAT@nm \NAT@yrsep\NAT@penalty\NAT@space\else
              \@citea \NAT@test{\@ne}\NAT@spacechar\NAT@mbox{\NAT@super@kern\NAT@@open}%
            \fi
            \if*#1*\else#1\NAT@spacechar\fi
            \NAT@mbox{\NAT@hyper@{{\citenumfont{\NAT@num}}}}%
            \NAT@def@citea@box
          \or
            \NAT@hyper@citea@space{\NAT@test{\NAT@ctype}}%
          \or
            \NAT@hyper@citea@space{\NAT@test{\NAT@ctype}}%
          \or
            \NAT@hyper@citea@space\NAT@alias
          \fi
        \fi
      }%
      }%
        \@ifnum{\NAT@cmprs>\z@}{\NAT@last@yr}{}%
        \ifNAT@swa\else
          % \@ifnum{\NAT@ctype=\z@}{%
          %   \if*#2*\else\NAT@cmt#2\fi
          % }{}%
          \NAT@mbox{\NAT@@close}%
          \@ifnum{\NAT@ctype=\z@}{%
            \if*#2*\else\textsuperscript{#2}\fi
          }{}%
        \fi
    }{#1}{#2}%
  }%
  \renewcommand\NAT@cite%
      [3]{\ifNAT@swa\NAT@@open\if*#2*\else#2\NAT@spacechar\fi
          % #1\if*#3*\else\NAT@cmt#3\fi\NAT@@close\else#1\fi\endgroup}
          #1\NAT@@close\if*#3*\else\textsuperscript{#3}\fi\else#1\fi\endgroup}
  \def\NAT@citex%
    [#1][#2]#3{%
    \NAT@reset@parser
    \NAT@sort@cites{#3}%
    \NAT@reset@citea
    \@cite{\let\NAT@nm\@empty\let\NAT@year\@empty
      \@for\@citeb:=\NAT@cite@list\do
      {\@safe@activestrue
      \edef\@citeb{\expandafter\@firstofone\@citeb\@empty}%
      \@safe@activesfalse
      \@ifundefined{b@\@citeb\@extra@b@citeb}{\@citea%
        {\reset@font\bfseries ?}\NAT@citeundefined
                  \PackageWarning{natbib}%
        {Citation `\@citeb' on page \thepage \space undefined}\def\NAT@date{}}%
      {\let\NAT@last@nm=\NAT@nm\let\NAT@last@yr=\NAT@year
        \NAT@parse{\@citeb}%
        \ifNAT@longnames\@ifundefined{bv@\@citeb\@extra@b@citeb}{%
          \let\NAT@name=\NAT@all@names
          \global\@namedef{bv@\@citeb\@extra@b@citeb}{}}{}%
        \fi
      \ifNAT@full\let\NAT@nm\NAT@all@names\else
        \let\NAT@nm\NAT@name\fi
      \ifNAT@swa\ifcase\NAT@ctype
        \if\relax\NAT@date\relax
          \@citea\NAT@hyper@{\NAT@nmfmt{\NAT@nm}\NAT@date}%
        \else
          \ifx\NAT@last@nm\NAT@nm\NAT@yrsep
              \ifx\NAT@last@yr\NAT@year
                \def\NAT@temp{{?}}%
                \ifx\NAT@temp\NAT@exlab\PackageWarningNoLine{natbib}%
                {Multiple citation on page \thepage: same authors and
                year\MessageBreak without distinguishing extra
                letter,\MessageBreak appears as question mark}\fi
                \NAT@hyper@{\NAT@exlab}%
              \else\unskip\NAT@spacechar
                \NAT@hyper@{\NAT@date}%
              \fi
          \else
            \@citea\NAT@hyper@{%
              \NAT@nmfmt{\NAT@nm}%
              \hyper@natlinkbreak{%
                \NAT@aysep\NAT@spacechar}{\@citeb\@extra@b@citeb
              }%
              \NAT@date
            }%
          \fi
        \fi
      \or\@citea\NAT@hyper@{\NAT@nmfmt{\NAT@nm}}%
      \or\@citea\NAT@hyper@{\NAT@date}%
      \or\@citea\NAT@hyper@{\NAT@alias}%
      \fi \NAT@def@citea
      \else
        \ifcase\NAT@ctype
          \if\relax\NAT@date\relax
            \@citea\NAT@hyper@{\NAT@nmfmt{\NAT@nm}}%
          \else
          \ifx\NAT@last@nm\NAT@nm\NAT@yrsep
              \ifx\NAT@last@yr\NAT@year
                \def\NAT@temp{{?}}%
                \ifx\NAT@temp\NAT@exlab\PackageWarningNoLine{natbib}%
                {Multiple citation on page \thepage: same authors and
                year\MessageBreak without distinguishing extra
                letter,\MessageBreak appears as question mark}\fi
                \NAT@hyper@{\NAT@exlab}%
              \else
                \unskip\NAT@spacechar
                \NAT@hyper@{\NAT@date}%
              \fi
          \else
            \@citea\NAT@hyper@{%
              \NAT@nmfmt{\NAT@nm}%
              \hyper@natlinkbreak{\NAT@spacechar\NAT@@open\if*#1*\else#1\NAT@spacechar\fi}%
                {\@citeb\@extra@b@citeb}%
              \NAT@date
            }%
          \fi
          \fi
        \or\@citea\NAT@hyper@{\NAT@nmfmt{\NAT@nm}}%
        \or\@citea\NAT@hyper@{\NAT@date}%
        \or\@citea\NAT@hyper@{\NAT@alias}%
        \fi
        \if\relax\NAT@date\relax
          \NAT@def@citea
        \else
          \NAT@def@citea@close
        \fi
      \fi
      }}\ifNAT@swa\else
        % \if*#2*\else\NAT@cmt#2\fi
        \if\relax\NAT@date\relax\else\NAT@@close\fi
        \if*#2*\else\textsuperscript{#2}\fi
      \fi}{#1}{#2}}
  \renewcommand\bibsection{\thu@chapter*{\bibname}}
  \newcommand\thu@set@bibliography@format{%
    \ifthu@degree@bachelor
      \renewcommand\bibfont{\fontsize{10.5bp}{17bp}\selectfont}%
      \setlength{\bibsep}{6bp \@plus 3bp \@minus 3bp}%
      \ifthu@main@language@chinese
        \setlength{\bibhang}{21bp}%
      \else
        \setlength{\bibhang}{0.5in}%
      \fi
    \else
      \renewcommand\bibfont{\fontsize{10.5bp}{16bp}\selectfont}%
      \setlength{\bibsep}{3bp \@plus 3bp \@minus 3bp}%
      \setlength{\bibhang}{21bp}%
    \fi
  }
  \thu@set@bibliography@format
  \thu@option@hook{degree}{\thu@set@bibliography@format}
  \thu@option@hook{main-language}{\thu@set@bibliography@format}
  \patchcmd\thebibliography{%
    \clubpenalty4000%
  }{%
    \interlinepenalty=5000\relax
    \clubpenalty=10000\relax
  }{}{\thu@patch@error{\thebibliography}}
  \patchcmd\thebibliography{%
    \widowpenalty4000%
  }{%
    \widowpenalty=10000\relax
  }{}{\thu@patch@error{\thebibliography}}
  \def\@biblabel#1{[#1]\hfill}
  \renewcommand\NAT@bibsetnum[1]{%
    % \settowidth\labelwidth{\@biblabel{#1}}%
    % \setlength{\leftmargin}{\labelwidth}%
    % \addtolength{\leftmargin}{\labelsep}%
    \setlength{\leftmargin}{1cm}%
    \setlength{\itemindent}{\z@}%
    \setlength{\labelsep}{0.1cm}%
    \setlength{\labelwidth}{0.9cm}%
    \setlength{\itemsep}{\bibsep}
    \setlength{\parsep}{\z@}%
    \ifNAT@openbib
      \addtolength{\leftmargin}{\bibindent}%
      \setlength{\itemindent}{-\bibindent}%
      \setlength{\listparindent}{\itemindent}%
      \setlength{\parsep}{0pt}%
    \fi
  }
}
\AtEndOfPackageFile*{biblatex}{
  \AtBeginDocument{
    \ifthenelse{\equal{\blx@bbxfile}{apa}}{\def\bibname{REFERENCES}}{}
    \ifthenelse{\equal{\blx@bbxfile}{apa6}}{\def\bibname{REFERENCES}}{}
    \ifthenelse{\equal{\blx@bbxfile}{mla}}{\def\bibname{WORKS CITED}}{}
    \ifthenelse{\equal{\blx@bbxfile}{mla-new}}{\def\bibname{WORKS CITED}}{}
  }
  \DeclareRobustCommand\inlinecite{\parencite}
  \defbibheading{bibliography}[\bibname]{\thu@chapter*{\bibname}}
  \newcommand\thu@set@bibliography@format{%
    \ifthu@degree@bachelor
      \renewcommand\bibfont{\fontsize{10.5bp}{17bp}\selectfont}%
      \setlength{\bibitemsep}{6bp \@plus 3bp \@minus 3bp}%
      \ifthu@main@language@chinese
        \setlength{\bibhang}{21bp}%
      \else
        \setlength{\bibhang}{0.5in}%
      \fi
    \else
      \renewcommand\bibfont{\fontsize{10.5bp}{16bp}\selectfont}%
      \setlength{\bibitemsep}{3bp \@plus 3bp \@minus 3bp}%
      \setlength{\biblabelsep}{0.1cm}%
      \setlength{\bibhang}{21bp}%
    \fi
  }
  \thu@set@bibliography@format
  \thu@option@hook{degree}{\thu@set@bibliography@format}
  \thu@option@hook{main-language}{\thu@set@bibliography@format}
}
\AtEndOfPackageFile*{apacite}{
  \AtBeginDocument{
    \thu@set@chapter@names
  }
  \renewcommand\bibliographytypesize{\fontsize{10.5bp}{17bp}\selectfont}
  \setlength{\bibitemsep}{6bp}
  \ifthu@main@language@chinese
    \setlength{\bibleftmargin}{21bp}
    \setlength{\bibindent}{-\bibleftmargin}
  \else
    \setlength{\bibleftmargin}{0.5in}
    \setlength{\bibindent}{-\bibleftmargin}
  \fi
  \def\st@rtbibchapter{%
    \if@numberedbib%
      \chapter{\bibname}%   e.g.,   6. References
    \else%
      \thu@chapter*{\bibname}%   e.g.,   References
    \fi%
  }%
}
\g@addto@macro\appendix{%
  \@mainmattertrue
}
\thu@define@key{
  toc-depth = {
    name = toc@depth,
  },
}
\thu@option@hook{toc-depth}{%
  \protected@write\@auxout{}{%
    \string\ttl@writefile{toc}{%
      \protect\setcounter{tocdepth}{\thu@toc@depth}%
    }%
  }%
  \addtocontents{lof}{\string\let\string\contentsline\string\ttl@gobblecontents}
  \addtocontents{lot}{\string\let\string\contentsline\string\ttl@gobblecontents}
  \addtocontents{loe}{\string\let\string\contentsline\string\ttl@gobblecontents}
}
\g@addto@macro\appendix{%
  \thusetup{
    toc-depth = 0,
  }%
}
\newenvironment{survey}{%
  \chapter{外文资料的调研阅读报告}%
  \thusetup{language = english}%
  \let\title\thu@appendix@title
  \let\maketitle\thu@appendix@maketitle
  \thu@set@partial@toc@format
  \renewcommand\tableofcontents{%
    \section*{Contents}%
    \thu@pdfbookmark{1}{Contents}%
    \printcontents[survey]{l}{1}[2]{}%
    \vskip 20bp%
  }%
  \renewcommand\bibname{参考文献}%
  \let\bibsection\thu@appendix@bibsection
  \renewcommand\@bibunitname{\jobname-survey}%
  \let\bibliographystyle\defaultbibliographystyle
  \let\bibliography\thu@appendix@bibliography
  \begin{bibunit}%
  \startcontents[survey]%
}{%
  \stopcontents[survey]%
  \end{bibunit}%
  \thu@reset@main@language % restore language
}
\newenvironment{translation}{%
  \chapter{外文资料的书面翻译}%
  \thusetup{language = chinese}%
  \let\title\thu@appendix@title
  \let\maketitle\thu@appendix@maketitle
  \thu@set@partial@toc@format
  \renewcommand\tableofcontents{%
    \section*{目录}%
    \thu@pdfbookmark{1}{目录}%
    \printcontents[translation]{l}{1}[2]{}%
    \vskip 20bp%
  }%
  \def\bibsection{%
    \begingroup
      \ctexset{section/numbering=false}%
      \section{\bibname}%
    \endgroup
  }%
  \renewcommand\@bibunitname{\jobname-translation}%
  \let\bibliographystyle\defaultbibliographystyle
  \let\bibliography\thu@appendix@bibliography
  \begin{bibunit}%
  \startcontents[translation]%
}{%
  \stopcontents[translation]%
  \end{bibunit}%
  \thu@reset@main@language % restore language
}
\newenvironment{translation-index}{%
  \begin{bibunit}%
    \renewcommand\@bibunitname{\jobname-index}%
    \renewcommand\bibname{书面翻译对应的原文索引}%
    \let\bibsection\thu@appendix@bibsection
}{%
  \end{bibunit}%
}
\DeclareRobustCommand\thu@appendix@title[1]{\gdef\thu@appendix@@title{#1}}
\newcommand\thu@appendix@maketitle{%
  \par
  \begin{center}%
    \xiaosi[1.667]\thu@appendix@@title
  \end{center}%
  \par
}
\newcommand\thu@set@partial@toc@format{%
  \titlecontents{section}
    [\z@]{}
    {\contentspush{\thecontentslabel\quad}}{}
    {\thu@leaders\thecontentspage}%
  \titlecontents{subsection}
    [1em]{}
    {\contentspush{\thecontentslabel\quad}}{}
    {\thu@leaders\thecontentspage}%
  \titlecontents{subsubsection}
    [2em]{}
    {\contentspush{\thecontentslabel\quad}}{}
    {\thu@leaders\thecontentspage}%
}
\newcommand\thu@appendix@bibsection{%
  \par
  \vskip 20bp%
  \thu@pdfbookmark{1}{\bibname}%
  \begingroup
    \centering
    \xiaosi[1.667]\bibname\par
  \endgroup
  \vskip 6bp%
}%
\newcommand\thu@appendix@bibliography[1]{\putbib[#1]}
\newenvironment{statementcopyright}{%
  \thu@chapter*{\thu@statement@toc@name}%
  \markboth{\thu@statement@name}{}%
  \ctexset{
    section = {
      format    += \centering,
      numbering = false,
    },
    subsection = {
      format     = \sffamily\fontsize{15bp}{20bp}\selectfont,
      numbering  = false,
    },
  }%
  \ifthu@degree@bachelor
    \ifthu@language@english
      \sffamily\fontsize{15bp}{20bp}\selectfont,
    \fi
  \fi
}{}
\newenvironment{resume}{%
  \@mainmatterfalse
  \thu@chapter*{\thu@resume@name}%
  \ctexset{
    section = {
      format    += \centering,
      numbering = false,
    },
    subsection = {
      format     = \sffamily\fontsize{14bp}{20bp}\selectfont,
      number  = （\chinese{subsection}）,
      aftername = \hspace{0pt},
      % aftertitle = \ifthu@language@chinese ：\else :\fi,
    },
  }%
  \ifthu@main@language@english
    \ctexset{%
    subsection = {
      numbering = false,
    }}
  \fi
  \ifthu@degree@bachelor
    \ifthu@language@english
      \sffamily\fontsize{15bp}{20bp}\selectfont,
    \fi
  \fi
}{}
\newcommand\resumeitem[1]{%
  \thu@error{The "\protect\resumeitem" is obsolete. Please update to the new format}%
}
\newcommand\researchitem[1]{%
  \thu@error{The "\protect\researchitem" is obsolete. Please update to the new format}%
}
\newlist{achievements}{enumerate}{1}
\setlist[achievements]{
  label      = [\arabic*],
  align      = left,
  leftmargin = 10mm,
  topsep     = 6bp,
  parsep     = 0bp,
  partopsep  = 0bp,
  itemsep    = 6bp,
  labelsep   = !,
  before     = {
    \ifthu@degree@graduate
      \fontsize{12bp}{16bp}\selectfont
    \fi
  },
  resume     = achievements,
}
\newenvironment{publications}{%
  \thu@deprecate{"publications" environment}{"achievements"}%
  \begin{achievements}%
}{%
  \end{achievements}%
}
\newcommand\publicationskip{%
  \thu@error{The "\protect\publicationskip" is obsolete. Do not use it}%
}
\newcommand{\record}[1]{%
  \let\thu@record@file\@empty
  \kv@define@key{thu@record}{file}{\let\thu@record@file\kv@value}%
  \kv@set@family@handler{thu@record}{%
    \ifx\kv@value\relax
      \let\thu@record@file\kv@key
    \else
      \kv@handled@false
    \fi
  }%
  \kvsetkeys{thu@record}{#1}%
  \ifx\thu@record@file\@empty
    \thu@error{File path of \protect\record\space is required}
  \fi
  \cleardoublepage
  \thu@pdfbookmark{0}{综合论文训练记录表}%
  \includepdf[pages=-]{\thu@record@file}%
}
\AtEndOfPackageFile*{hyperref}{
  \hypersetup{
    linktoc            = all,
    bookmarksdepth     = 2,
    bookmarksnumbered  = true,
    bookmarksopen      = true,
    bookmarksopenlevel = 1,
    bookmarksdepth     = 3,
    unicode            = true,
    psdextra           = true,
    breaklinks         = true,
    plainpages         = false,
    pdfdisplaydoctitle = true,
    hidelinks,
  }%
  \newcounter{thu@bookmark}
  \renewcommand\thu@pdfbookmark[2]{%
    \phantomsection
    \stepcounter{thu@bookmark}%
    \pdfbookmark[#1]{#2}{thuchapter.\thethu@bookmark}%
  }
  \renewcommand\thu@phantomsection{%
    \phantomsection
  }
  \pdfstringdefDisableCommands{
    \let\\\relax
    \let\quad\relax
    \let\hspace\@gobble
  }%
  \@ifpackagelater{hyperref}{2019/04/27}{}{%
    \g@addto@macro\psdmapshortnames{\let\mu\textmu}
  }%
  \ifthu@main@language@chinese
    \hypersetup{
      pdflang = zh-CN,
    }%
  \else
    \hypersetup{
      pdflang = en-US,
    }%
  \fi
  \AtBeginDocument{%
    \ifthu@main@language@chinese
      \hypersetup{
        pdftitle    = \thu@title,
        pdfauthor   = \thu@author,
        pdfsubject  = \thu@subject,
        pdfkeywords = \thu@keywords,
      }%
    \else
      \hypersetup{
        pdftitle    = \thu@title@en,
        pdfauthor   = \thu@author@en,
        pdfsubject  = \thu@subject@en,
        pdfkeywords = \thu@keywords@en,
      }%
    \fi
    \hypersetup{
      pdfcreator={\thuthesis-v\version}}
  }%
}
\AtEndOfPackageFile*{nomencl}{
  \let\nomname\thu@denotation@name
  \def\thenomenclature{\begin{denotation}[\nom@tempdim]}
  \def\endthenomenclature{\end{denotation}}
}
\AtEndOfPackageFile*{siunitx}{%
  \sisetup{
    group-minimum-digits = 4,
    separate-uncertainty = true,
    inter-unit-product   = \ensuremath{{}\cdot{}},
  }
  \newcommand\thu@set@siunitx@language{%
    \ifthu@language@chinese
      \sisetup{
        list-final-separator = { 和 },
        list-pair-separator  = { 和 },
        range-phrase         = {～},
      }%
    \else
      \ifthu@language@english
        \sisetup{
          list-final-separator = { and },
          list-pair-separator  = { and },
          range-phrase         = { to },
        }%
      \fi
    \fi
  }
  \thu@set@siunitx@language
  \thu@option@hook{language}{\thu@set@siunitx@language}
}
\AtEndOfPackageFile*{amsthm}{%
  \newtheoremstyle{thu}
    {\z@}{\z@}
    {\normalfont}{\z@}
    {\normalfont\sffamily}{\thu@theorem@separator}
    {0.5em}{}
  \theoremstyle{thu}
  \newtheorem{assumption}{\thu@assumption@name}[chapter]%
  \newtheorem{definition}{\thu@definition@name}[chapter]%
  \newtheorem{proposition}{\thu@proposition@name}[chapter]%
  \newtheorem{lemma}{\thu@lemma@name}[chapter]%
  \newtheorem{theorem}{\thu@theorem@name}[chapter]%
  \newtheorem{axiom}{\thu@axiom@name}[chapter]%
  \newtheorem{corollary}{\thu@corollary@name}[chapter]%
  \newtheorem{exercise}{\thu@exercise@name}[chapter]%
  \newtheorem{example}{\thu@example@name}[chapter]%
  \newtheorem{remark}{\thu@remark@name}[chapter]%
  \newtheorem{problem}{\thu@problem@name}[chapter]%
  \newtheorem{conjecture}{\thu@conjecture@name}[chapter]%
  \renewenvironment{proof}[1][\thu@proof@name]{\par
    \pushQED{\qed}%
    % \normalfont \topsep6\p@\@plus6\p@\relax
    \normalfont \topsep\z@\relax
    \trivlist
    \item[\hskip\labelsep
      %     \itshape
      % #1\@addpunct{.}]\ignorespaces
      \sffamily
      #1\@addpunct{\thu@theorem@separator}]\ignorespaces
  }{%
    \popQED\endtrivlist\@endpefalse
  }
  \renewcommand\qedsymbol{\ensuremath{\QED}}
}
\AtEndOfPackageFile*{ntheorem}{%
  \theorembodyfont{\normalfont}%
  \theoremheaderfont{\normalfont\sffamily}%
  \theoremsymbol{\ensuremath{\QED}}%
  \newtheorem*{proof}{\thu@proof@name}%
  \theoremstyle{plain}%
  \theoremsymbol{}%
  \theoremseparator{\thu@theorem@separator}%
  \newtheorem{assumption}{\thu@assumption@name}[chapter]%
  \newtheorem{definition}{\thu@definition@name}[chapter]%
  \newtheorem{proposition}{\thu@proposition@name}[chapter]%
  \newtheorem{lemma}{\thu@lemma@name}[chapter]%
  \newtheorem{theorem}{\thu@theorem@name}[chapter]%
  \newtheorem{axiom}{\thu@axiom@name}[chapter]%
  \newtheorem{corollary}{\thu@corollary@name}[chapter]%
  \newtheorem{exercise}{\thu@exercise@name}[chapter]%
  \newtheorem{example}{\thu@example@name}[chapter]%
  \newtheorem{remark}{\thu@remark@name}[chapter]%
  \newtheorem{problem}{\thu@problem@name}[chapter]%
  \newtheorem{conjecture}{\thu@conjecture@name}[chapter]%
}
\PassOptionsToPackage{chapter}{algorithm}
\AtEndOfPackageFile*{algorithm}{
  \floatname{algorithm}{\thu@algorithm@name}
  \g@addto@macro\appendix{\renewcommand*{\thealgorithm}{\thechapter-\arabic{algorithm}}}
  \renewcommand\listofalgorithms{%
    \thu@listof{algorithm}%
  }
  \renewcommand\listalgorithmname{\thu@list@algorithm@name}
  \def\ext@algorithm{loa}
  \contentsuse{algorithm}{loa}
  \titlecontents{algorithm}
    [\z@]{}
    {\contentspush{\fname@algorithm~\thecontentslabel\quad}}{}
    {\thu@leaders\thecontentspage}
}
\PassOptionsToPackage{algochapter}{algorithm2e}
\AtEndOfPackageFile*{algorithm2e}{
  \renewcommand\algorithmcfname{\thu@algorithm@name}
  \SetAlgoCaptionLayout{thu@caption@font}
  \SetAlCapSty{relax}
  \SetAlgoCaptionSeparator{\hspace*{1em}}
  \SetAlFnt{\fontsize{11bp}{14.3bp}\selectfont}
  \renewcommand\listofalgorithms{%
    \thu@listof{algorithmcf}%
  }
  \renewcommand\listalgorithmcfname{\thu@list@algorithm@name}
  \def\ext@algorithmcf{loa}
  \contentsuse{algocf}{loa}
  \titlecontents{algocf}
    [\z@]{}
    {\contentspush{\algorithmcfname~\thecontentslabel\quad}}{}
    {\thu@leaders\thecontentspage}
}
\AtEndOfPackageFile*{minted}{
  \g@addto@macro\appendix{\renewcommand*{\thelisting}{\thechapter-\arabic{listing}}}%
  \newcommand\thu@set@listing@language{%
    \ifthu@language@chinese
      \floatname{listing}{代码}%
    \else
      \floatname{listing}{Listing}%
    \fi
  }
  \thu@set@listing@language
  \thu@option@hook{language}{\thu@set@listing@language}
}
\thu@define@key{
  spine-font = {
    name = spine@font,
    default = {\sanhao},
  },
  spine-title = {
    name = spine@title,
  },
  spine-author = {
    name = spine@author,
  },
}
\newcommand*\CJKmovesymbol[1]{\raise.3em\hbox{#1}}
\newcommand*\CJKmove{%
  \punctstyle{plain}%
  \let\CJKsymbol\CJKmovesymbol
  \let\CJKpunctsymbol\CJKsymbol
}
\NewDocumentCommand{\spine}{
    O{
      \ifx\thu@spine@title\@empty
        \thu@title
      \else
        \thu@spine@title
      \fi
    }
    O{
      \ifx\thu@spine@author\@empty
        \thu@author
      \else
        \thu@spine@author
      \fi
    }}{%
  \clearpage
  \ifthu@degree@bachelor
    \newgeometry{
      vmargin = 3cm,
      hmargin = 1cm,
    }%
  \else
    \newgeometry{
      vmargin = 5.5cm,
      hmargin = 1cm,
    }%
  \fi
  \thispagestyle{empty}%
  \ifthu@main@language@chinese
    \thu@pdfbookmark{0}{书脊}%
  \else
    \thu@pdfbookmark{0}{Spine}%
  \fi
  \begingroup
    \noindent\hfill
    \rotatebox[origin=lt]{-90}{%
      \makebox[\textheight]{%
        \fangsong
        \addCJKfontfeatures*{RawFeature={vertical}}%
        \thu@spine@font
        \CJKmove
        #1\hfill
        \thu@stretch{4.5em}{#2}%
      }%
    }%
  \endgroup
  \clearpage
  \restoregeometry
}
\newcommand\thu@input@spine{%
  \IfFileExists{spine.pdf}{}{%
    \immediate\write18{xelatex spine.tex}%
    \IfFileExists{spine.pdf}{}{%
      \thu@error{Cannot find file "spine.pdf". Compile "spine.tex" first, or enable shell escape}%
    }%
  }%
  \includepdf[pages=1]{spine.pdf}%
}
\newcommand\thu@spine{%
  \ifthu@cjk@font@fandol
    \thu@input@spine
  \else
    \ifthu@cjk@font@noto
      \thu@input@spine
    \else
      \spine
    \fi
  \fi
}
\DeclareRobustCommand\cs[1]{\texttt{\char`\\#1}}
\DeclareRobustCommand\file{\nolinkurl}
\DeclareRobustCommand\env{\textsf}
\DeclareRobustCommand\pkg{\textsf}
\DeclareRobustCommand\cls{\textsf}
\sloppy
\endinput
%%
%% End of file `thuthesis.cls'.
