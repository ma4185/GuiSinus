#Programmieraufgabe zum 16.06.2015
         WP Daten und Algorithmen
         Jade Hochschule Oldenburg

##Autoren  
          - Nora Jürgens (6006799)
          - Hanna Möhle (6006825)
          - Maren Osterloh (6007218)

##Aufgabenstellung
         Es sollte ein Programm erstellt werden, welches sinusoidale Kreiswellen grafisch darstellt. Es sollen
         unterschiedlich viele Schallquellen möglich sein, sodass Interferenz zwischen den Kreiswellen gezeigt werden kann.
         Zusätzlich soll an einem beliebigen Punkt die lokale Wellenform als Linienplot ausgegeben werden.
    
##Dependencies
         1. Matlab Version R2015a

##Speicherort
         Der Code wave_infinity.m kann in einem beliebigen Ordner abgelegt werden. 
         
##Benutzungshinweise
         Die Codes sine_wave_a_Startbutton und wave4_Startbutton stellen die Testversion für die Animation dar. Die Vorlage
         zu diesem Code haben wir aus folgendder Quelle: Oleg Alexandro, File:Two sources interference.gif , erstellt am
         03:11, 13 January 2008 (UTC), URL: http://commons.wikimedia.org/wiki/File:Two_sources_interference.gif, zuletzt
         besucht am 15.06.2015 13:54.
         Auf dieser Basis wurde die Enddatei wave_infinity.m erstellt.
         Im Command Window wird die Datei wave_infinity.m ohne weitere Eingabeparameter aufgerufen.
         Es öffnet sich eine Gui in der folgende Parameter ausgewählt werden können: Anzahl der Schallquellen mit Hilfe eines
         Popupmenüs und die Frequenz der Wellenbewegung und Amplitude der Welle mit Hilfe von zwei Slidern. Um die Animation
         zu starten kann der Pushbotton 'Start' gedrückt werden. Wird dieser Button ein weiteres Mal gedrückt, kann die
         Animation gestoppt werden.
         Nach der Einstellung der jeweiligen Parameter gibt es eine zusätzliche Funktion, die die lokale Wellenform an einem
         beliebigen Punkt in der Welle ausgibt. Hierzu kann mit der Maus an einem beliebigen Punkt in dem Graphen, im Bereich
         der Welle gedrückt werden (hier ist manchmal ein Doppelklick notwendig). Danach öffnet sich ein zweites Fenster, in
         dem die Wellenform an dem Punkt zweidimensional über die Zeit angegeben wird. 
         Diese Ausgabe läuft nur dann, wenn bei der Graphik der Kreiswelle der Startbutton betätigt wurde und die Animation
         läuft.
         
         wichtiger Hinweis: Während der Ausgabe der lokalen Wellenform kann die Frequenz und Amplitude nicht verändert
         werden. 
         
##Änderungshistorie
         1. sine_wave.m (03.06.2015)
         2. sine_wave2.m (04.06.2015)
         3. wave2.m (04.06.2015)
         4. wave3.m (04.06.2015)
         5. sine_wave_a.m (08.06.2015)
         6. wave4.m Version 1.0 (08.06.2015)
         7. wave sine.m Version 2.0 (08.06.2015)
         8. sine_wave_a_Startbutton.m (09.06.2015)
         9. wave_4_Startbutton.m (09.06.2015)
         10. wave_inifity.m (09.06.2015)
         11. wave_inifity.m (Endversion 16.06.2015)
         
         
