# Hitobito Jemk

This hitobito wagon defines the organization hierarchy with groups and roles
of Jemk.


## Organization Hierarchy


(Output of rake app:hitobito:roles)

<!-- roles:start -->
    * Dachverband
      * Dachverband
        * Administrator/-in: 2FA [:admin, :layer_and_below_full, :impersonation]
      * Vorstand
        * Präsident/-in: [:layer_read, :group_and_below_full, :contact_data]
        * Kassier/-in: [:layer_and_below_read, :finance, :contact_data]
        * Mitglied: [:layer_read, :contact_data]
      * Geschäftsstelle
        * Geschäftsleiter/-in: 2FA [:admin, :layer_and_below_full, :impersonation, :contact_data, :finance]
        * Angestellte/-r: 2FA [:admin, :layer_and_below_full, :impersonation, :contact_data, :finance]
      * Gremium
        * Leiter/-in: [:layer_read, :group_and_below_full, :contact_data]
        * Kassier/-in: [:layer_read, :finance]
        * Mitglied: [:layer_read]
      * Mitglieder
        * Adressverwalter/-in: [:group_and_below_full]
        * Mitglied: []
    * Lagerverein < Dachverband
      * Lagerverein
        * Administrator/-in: [:layer_and_below_full]
      * Verein
        * Leiter/-in: [:layer_read, :group_and_below_full, :contact_data]
        * Kassier/-in: [:layer_read, :finance]
        * Mitglied: [:layer_read]
    * Region < Dachverband
      * Region
        * Administrator/-in: [:layer_and_below_full]
      * Vorstand
        * Präsident/-in: [:layer_and_below_read, :group_and_below_full, :contact_data]
        * Kassier/-in: [:layer_and_below_read, :finance, :contact_data]
        * Mitglied: [:layer_and_below_read, :contact_data]
      * Geschäftsstelle
        * Geschäftsleiter/-in: [:layer_and_below_full, :finance, :contact_data]
        * Angestellte/-r: [:layer_and_below_full, :finance, :contact_data]
      * Gremium
        * Leiter/-in: [:layer_and_below_read, :group_and_below_full, :contact_data]
        * Kassier/-in: [:layer_and_below_read, :finance]
        * Mitglied: [:group_and_below_read]
      * Mitglieder
        * Adressverwalter/-in: [:group_and_below_full]
        * Mitglied: []
    * Ortsjungschar < Region
      * Ortsjungschar
        * Hauptleitung: [:layer_and_below_full, :contact_data]
        * Adressverwaltung: [:group_and_below_full, :contact_data]
        * Coach: [:layer_and_below_full, :approve_applications, :contact_data]
        * Kassier: [:layer_read, :finance]
        * Materialverantwortliche/-r: [:layer_and_below_read, :contact_data]
      * Vorstand
        * Präsident/-in: [:layer_full, :contact_data]
        * Sekretär/-in: [:layer_full, :contact_data]
        * Vorstandsmitglied: [:layer_full, :contact_data]
      * Gremium / Projektgruppe
        * Leiter/-in: [:group_and_below_full, :contact_data]
        * Mitglied: [:group_and_below_read]
      * Mitglieder
        * Aktivmitglied: []
        * Passivmitglied: []
(Output of rake app:hitobito:roles)
<!-- roles:end -->
