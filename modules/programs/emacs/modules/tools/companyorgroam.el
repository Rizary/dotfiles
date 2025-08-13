(use-package company-org-roam
  :when (featurep :completion company)
  :after org-roam
  :config
  (set-company-backend 'org-mode '(company-org-roam)))

(provide 'companyorgroam)
;;; companyorgroam.el ends here
