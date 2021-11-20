;;; packages.el --- fortran layer packages file for Spacemacs.
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

(defconst fortran-packages
  '(
    flycheck
    (f90 :location built-in)
    ))

(defun fortran/init-f90 ()
  (use-package f90
    :ensure nil
    :mode (("\\.f90\\'" . f90-mode))
    :config
    (setq f90-auto-keyword-case #'downcase-word)
    ))

(defun fortran/post-init-flycheck ()
  (progn
    (spacemacs/enable-flycheck 'f90-mode)
    (setq flycheck-gfortran-language-standard "f2018")
    (setq flycheck-gfortran-args "-fcoarray=single")))
