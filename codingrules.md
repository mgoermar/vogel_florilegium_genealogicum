# vogel_florilegium_genealogicum - Kodierrichtlinien

Die Kodierung und Annotation des Editionstextes richtet sich grundsätzlich nach den Regeln der [TEI (P5)](https://tei-c.org/release/doc/tei-p5-doc/en/html/index.html). Für einzelne Textphänomene wurden zudem die Regeln des [DTA-Basisformats](https://www.deutschestextarchiv.de/doku/basisformat/) und der [Digitalen Edition und Kommentierung der Tagebücher des Fürsten Christian II. von Anhalt-Bernburg (1599-1656)](http://diglib.hab.de/edoc/ed000228/start.htm) zum Vorbild genommen.

## Allgemeine Struktur

Die Stammtafeln werden in einem &lt;div>-Element kodiert, das ein @xml:id-Attribut enthält nach folgendem Muster: &lt;div xml:id="stammbaum_moench">. Sie verfügen in der Regel über eine Kopfzeile, die den jeweiligen Familiennamen angibt. Sie wird mit dem Element &lt;head> kodiert (z. B. "&lt;head>Das Geschlecht-Register derer Mönche&lt;/head>"). Die darauf folgende Stammtafel wird als gegebenenfalls geschachtelte Tabelle kodiert, in der horizontale Schweifklammern im Element &lt;cell> mit dem Attribut @rendition="#topBraced" annotiert werden (s. u.). Als Vorlage kann die Datei [moench.xml](https://github.com/mgoermar/vogel_florilegium_genealogicum/blob/main/stammtafeln/moench.xml) dienen.

## Einzelne Textphänomene

Textphänomen | Kodierung | Erläuterungen
-------- | -------- | --------
Seitenwechsel | &lt;pb facs="rep_6_16-a_0426.jpg" n="211v"/> |
Zeilenwechsel | &lt;lb/> |
Worttrennungen | &lt;w lemma="Quartiermeister">Quartier&lt;lb/><br>meister&lt;/w> |
Tabellen | &lt;table><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;row><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;cell>...&lt;/cell><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/row><br>&lt;/table><br><br>bzw.<br><br>&lt;table><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;row><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;cell rendition="#topBraced">...&lt;/cell><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/row><br>&lt;/table> | Können gegebenenfalls geschachtelt werden.
Listen | &lt;list><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;item>...&lt;/item><br>&lt;/list> | Werden z. B. bei der Aufzählung mehrerer Ehefrauen verwendet.
originale Ergänzungen | &lt;add place="above">...&lt;/add> | In @place können folgende Werte vorkommen: above (d. h. oberhalb der Zeile/des Wortes),     below (d. h. unterhalb der Zeile/des Worts)     bottom (d. h. am Fuß derselben Seite), inline (d. h. innerhalb des Textes in derselben Zeile, ggf. durch Überschreibung eines Wortes, oder durch nachträgliche Verlängerung der Zeile, auch in den Randbereich hinein; vgl. margin), inspace (d. h. in einem Textzwischenraum, sowohl als zwischen zwei Wörter gequetschte Ergänzung als auch in einem vorher extra dafür vorgesehenen Freiraum), margin_left (d. h. als Marginalie am linken Rand), margin_left_above (d. h. als Marginalie am linken Rand [deutlich] oberhalb),  margin_left_below (d. h. als Marginalie am linken Rand [deutlich] unterhalb),    margin_left_top (d. h. als Marginalie am linken Rand am Anfang der Seite),    margin_right (d. h. als Marginalie am rechten Rand),    margin_right_top (d. h. als Marginalie am rechten Rand am Anfang der Seite),    opposite (d. h. auf der gegenüberliegenden Seite),    opposite_top (d. h. auf der gegenüberliegenden Seite am Anfang),    overleaf (d. h. auf der rückwärtigen Seite/der Rückseite desselben Blattes),    top (d. h. am Anfang der Seite).
Streichungen | &lt;del>...&lt;/del> |
Streichungen mit Korrektur | &lt;subst>&lt;del>...&lt;/del>&lt;add place="above">...&lt;/add>&lt;/subst> | 
Unleserlicher Text | &lt;unclear reason="invisible">...&lt;/unclear> | Innerhalb des Elements &lt;unclear> wird unleserlicher Text, der sich nicht erschließen lässt, durch Auslassungszeichen (...) kenntlich gemacht. Sollten verlorene Textteile durch Konjektur erschlossen werden können, so wird statt der Auslassungszeichen der erschlossene Text innerhalb von &lt;unclear> ergänzt. Gründe für die Unleserlichkeit werden im Attribut @reason kodiert. Mögliche Werte hierfür sind: invisible (d. h. der Text ist nicht sichtbar, z. B. weil er durch eine zu enge Bindung im Falz verschwindet) und illegible (d. h. der Text ist durch einen Tintenfleck oder Streichung nicht lesbar).
Textverlust | &lt;damage>...&lt;/damage> |  	Innerhalb des Elements &lt;damage> wird durch Schäden (z. B. Papierausriss) verlorener Text, der sich nicht rekonstruieren lässt, durch Auslassungszeichen (...) kenntlich gemacht. Sollten verlorene Textteile durch Konjektur erschlossen werden können, so wird statt der Auslassungszeichen der erschlossene Text innerhalb von &lt;damage> ergänzt.
Abkürzungen | Churf&lt;ex>ürstlich&lt;/ex> | Abkürzungen werden meist mit dem Element &lt;ex> aufgelöst, wobei Abkürzungszeichen der Vorlage entfallen.
Abkürzungen von Wortteilen durch Zahlen | &lt;choice>&lt;abbr>Xbr&lt;ex>is&lt;/ex>&lt;/abbr>&lt;expan>Decembris&lt;/expan>&lt;/choice> | 
Texthervorhebungen (Unterstreichung, hochgestellte Buchstaben usw.) | &lt;hi rendition="#et">...&lt;/hi> | Die Werte für @rendition folgen dem [DTA-Basisformat](https://www.deutschestextarchiv.de/doku/basisformat/typogrAllg.html). 

## Kommentare und Sacherschließung

Textphänomen | Kodierung | Erläuterungen
-------- | -------- | --------
Textkritischer Kommentar | &lt;note type="annotation" resp="mg">...&lt;/note> |
Sachkommentar | &lt;note type="footnote" resp="mg">...&lt;/note> |
Identifizierbare Personen, Orte und Körperschaften | <rs type="person" ref="#muench_georg">Georg Münch</rs> | @type kann die Werte "person", "place" und "org" annehmen, die jeweils auf das Personen-, Orts- und Körperschaftsregister verweisen.