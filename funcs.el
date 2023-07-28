;;; funcs.el --- fortran layer functions file for Spacemacs.
;;
;; This file is not part of GNU Emacs.
;;
;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.


(defun spacemacs//fortran-format-buffer ()
  "Format current fortran buffer."
  (interactive)
  (if (executable-find "fprettify")
      (progn
        (shell-command (format "fprettify --silent %s"
                              (shell-quote-argument (buffer-file-name)))))
    (message "Error: Cannot find fprettify executable.")))


(defun spacemacs//fortran-setup-backend ()
  "Conditionally setup fortran backend."
  (when (eq fortran-backend 'lsp)
    (spacemacs//fortran-setup-lsp)))


;; lsp

(defun spacemacs//fortran-setup-lsp ()
  "Start lsp-mode and configure for the buffer."
  (if (configuration-layer/layer-used-p 'lsp)
      (lsp-deferred)
    (message "`lsp' layer is not installed, please add `lsp' layer to your dotfile.")))
