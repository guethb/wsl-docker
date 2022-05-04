# wsl-docker
Dieses Repository soll helfen, eine Entwicklungsumgebung für Docker unter WSL2 lauffähig zu machen.

# Installieren von WSL2 
Der Benutzer muss für die Installation von WSL2 lokale Administratorrechte besitzen.
Microsoft liefert eine [detaillierte Beschreibung](https://docs.microsoft.com/de-de/windows/wsl/install-manual) des Setup-Prozesses.

# Klonen des Repositories
Damit von der Entwicklungsumgebung Verbindungen ins Internet funktionieren, müssen ggf. Proxy-Variablen gesetzt werden.

    export http_proxy=http://proxy:8080
    export https_proxy=https://proxy:8443

Das Repository kann geklont werden

    git clone https://github.com/guethb/wsl-docker.git

# Installation von Docker
`install-docker.sh` installiert die notwendigen Pakete und konfiguriert diese vor. Während der Installation werden die Proxy-Variablen für den Docker-Daemon aus dem vorhergehenden Schritt für dessen Konfiguration herangezogen.

    sudo -u root /bin/bash wsl-docker/install-docker.sh

Soll der aktuelle (nicht-Root) Benutzer *user* den Docker Daemon verwenden, muss dieser noch der Gruppe hinzugefügt werden. In der Regel ist der Benutzer Mitglied der Gruppe *sudo*:

    sudo -u root usermod -G sudo,docker <user>

# Umgebung
Die Datei `bash_profile` enthält Aliases und Funktionen, die das Arbeiten mit dem Dockerclient vereinfachen sollen. Außerdem startet es den Docker-Daemon beim Login. Die Datei wird folgendermaßen in das Home-Verzeichnis kopiert:

    cp wsl-docker/bash_profile ~/.bash_profile

|Kommando|Beschreibung|
|---|---|
|`dr`| Alias für /usr/bin/docker.|
|`drc <container>`| Führt eine Konsole auf dem *container* aus.|
|`drtar <file> <volume>`|Entpackt das gezipptes Tar-Archiv *file* in ein *volume*.|
