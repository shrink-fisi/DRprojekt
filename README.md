# Automatisierte Bereitstellung von homogen konfigurierten Diensten zur Gewährleistung der Geschäftskontinuität

Dieses Projekt wurde im Rahmen der Abschlussprüfung zum Fachinformatiker für Systemintegration durchgeführt. Es bietet eine Lösung zur automatisierten Bereitstellung einer minimalen IT-Infrastruktur, um bei Hardwareausfällen die Geschäftskontinuität zu gewährleisten.
Projektziel

Das Projekt zielt darauf ab, im Falle eines Hardwareausfalls eine Minimalinfrastruktur innerhalb von 30 Minuten bereitzustellen, um kritische IT-Dienste schnell wiederherzustellen. Dies wird durch die Nutzung von Infrastructure-as-Code (IaC) mit Ansible und Terraform auf einem Proxmox-Cluster erreicht.

Das Projekt besteht aus zwei Phasen:

    Phase 1: Vollständig automatisierte Bereitstellung der Kerninfrastruktur (Domänencontroller, Netzlaufwerke, Druckserver).
    Phase 2: Evaluierung der Einbindung von bestehenden File-Level-Backups zur Wiederherstellung von Domänencontrollern.

Infrastruktur

Die Infrastruktur für die Wiederherstellung umfasst:

    Zwei Windows Server 2022 Domänencontroller (jeweils für Schulungs- und Verwaltungsdomänen) mit DNS- und DHCP-Diensten.
    Netzlaufwerke und Druckserver für beide Domänen.
    Managementserver auf Basis von Semaphore zur Verwaltung der IaC-Prozesse.
    Bereitstellung der Infrastruktur erfolgt auf einem Proxmox-Cluster mit Terraform und Ansible.

Technologien

    Proxmox VE: Plattform zur Verwaltung der virtuellen Maschinen.
    Ansible: Zur Konfiguration und Automatisierung der Dienste.
    Terraform: Für die automatisierte Provisionierung der VMs.
    Semaphore: Web-GUI zur Verwaltung der Ansible- und Terraform-Skripte.

Hinweis

# Dieses Repository enthält die grundlegenden Skripte und Konfigurationsdateien für die Implementierung der Infrastruktur. Einige spezifische, interne Konfigurationen und Backupdateien wurden aus Sicherheitsgründen weggelassen.

Highlights:

    Schnelle Wiederherstellung der IT-Dienste bei einem Ausfall in unter 30 Minuten.
    Automatisierte Bereitstellung einer Minimalinfrastruktur mittels Open-Source-Technologien.
    Nutzung von paralleler Ausführung von Skripten zur Zeitoptimierung.
    Evaluierung von DSInternals für die Wiederherstellung von Active Directory-Domänen aus Backups.
