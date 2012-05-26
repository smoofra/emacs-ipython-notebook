;;; ein-subpackages.el --- Subpacakge management

;; Copyright (C) 2012- Takafumi Arakaki

;; Author: Takafumi Arakaki

;; This file is NOT part of GNU Emacs.

;; ein-subpackages.el is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; ein-subpackages.el is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with ein-subpackages.el.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;;

;;; Code:

(eval-when-compile (defvar ein:ac-config-once-called)
                   (defvar ein:smartrep-config-once-called))

(declare-function ein:ac-config-once "ein-ac")
(declare-function ein:smartrep-config-once "ein-smartrep")


(defcustom ein:use-auto-complete nil
  "Set to `t' to use preset auto-complete configuration."
  :type 'boolean
  :group 'ein)

(defcustom ein:use-auto-complete-superpack nil
  "Set to `t' to use preset a little bit hacky auto-complete configuration."
  :type 'boolean
  :group 'ein)

(defcustom ein:use-smartrep nil
  "Set to `t' to use preset smartrep configuration."
  :type 'boolean
  :group 'ein)

(defcustom ein:load-dev nil
  "Load development helper."
  :type 'boolean
  :group 'ein)

(defun ein:subpackages-load ()
  "Load sub-packages depending on configurations."
  (when (or ein:use-auto-complete
            ein:use-auto-complete-superpack)
    (require 'ein-ac)
    (ein:ac-config-once ein:use-auto-complete-superpack))
  (when ein:use-smartrep
    (require 'ein-smartrep)
    (ein:smartrep-config-once))
  (when ein:load-dev
    (require 'ein-dev)))

(defun ein:subpackages-reload ()
  "Reload sub-packages."
  (interactive)
  (setq ein:ac-config-once-called nil)
  (setq ein:smartrep-config-once-called nil)
  (ein:subpackages-load))

(provide 'ein-subpackages)

;;; ein-subpackages.el ends here
