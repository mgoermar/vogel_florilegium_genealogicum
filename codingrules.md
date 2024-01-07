# vogel_florilegium_genealogicum - Kodierrichtlinien

Die Kodierung und Annotation des Editionstextes richtet sich grundsätzlich nach den Regeln der [TEI (P5)](https://tei-c.org/release/doc/tei-p5-doc/en/html/index.html). Für einzelne Textphänomene wurden zudem die Regeln des [DTA-Basisformats](https://www.deutschestextarchiv.de/doku/basisformat/) und der [Digitalen Edition und Kommentierung der Tagebücher des Fürsten Christian II. von Anhalt-Bernburg (1599-1656)](http://diglib.hab.de/edoc/ed000228/start.htm) zum Vorbild genommen.

## Allgemeine Struktur

Die Stammtafeln werden in einem &lt;div>-Element kodiert, das ein @xml:id-Attribut enthält nach folgendem Muster: &lt;div xml:id="stammbaum_moench">. Sie verfügen in der Regel über eine Kopfzeile, die den jeweiligen Familiennamen angibt. Sie wird mit dem Element &lt;head> kodiert (z. B. "&lt;head>Das Geschlecht-Register derer Mönche&lt;/head>"). Die darauf folgende Stammtafel wird als gegebenenfalls geschachtelte Tabelle kodiert, in der horizontale Schweifklammern im Element &lt;cell> mit dem Attribut @rendition="#topBraced" annotiert werden (s. u.). Als Vorlage kann die Datei [moench.xml](https://github.com/mgoermar/vogel_florilegium_genealogicum/blob/main/stammtafeln/moench.xml) dienen.

## Einzelne Textphänomene

Textphänomen | Kodierung
-------- | --------
Seitenwechsel | &lt;pb facs="rep_6_16-a_0426.jpg" n="211v"/>
Zeilenwechsel | &lt;lb/>
Tabellen | &lt;table><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;row><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;cell>...&lt;/cell><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/row><br>&lt;/table><br><br>bzw.<br><br>&lt;table><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;row><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;cell rendition="#topBraced">...&lt;/cell><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/row><br>&lt;/table>
Listen |
