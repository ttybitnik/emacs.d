;;; tty-org-orgmdb.el --- Org-mode OMDb API -*- lexical-binding: t -*-

;;; Commentary:

;; Orgmdb-related tunings.

;;; Code:

(require-package 'orgmdb)

;;* Variables:

;;* Functions:

(defun orgmdb-insert-media-data-string/ttybitnik (&rest args)
  "Return movie info and poster of given ARGS as a string.
  ARGS should be in the same form with `orgmdb' function."
  (let ((info (apply #'orgmdb `(,@args :episode all :plot full))))
    (orgmdb--ensure-response-is-successful info)
    (concat
     (format "* %s (%s) - %s\n" (orgmdb-title info)
	         (orgmdb-year info) (orgmdb-imdb-link info))
     "\n"
     (format "[[file:%s]]\n\n" (orgmdb--download-image-for info))
     (format "- Genre :: %s\n" (orgmdb-genre info))
     (format "- Runtime :: %s\n" (orgmdb-runtime info))
     (format "- Released :: %s\n" (orgmdb-released info))
     (format "- Rated :: %s\n" (orgmdb-rated info))
     "\n"
     (format "- Director :: %s\n" (orgmdb-director info))
     (format "- Writer :: %s\n" (orgmdb-writer info))
     (format "- Production :: %s\n" (orgmdb-writer info))
     (format "- Actors :: %s\n" (orgmdb-actors info))
     "\n"
     (format "- Language :: %s\n" (orgmdb-language info))
     (format "- Country :: %s\n" (orgmdb-country info))
     (format "- Awards :: %s\n" (orgmdb-awards info))
     "\n"
     (format "- Metacritic :: %s\n" (orgmdb-metacritic info))
     (format "- IMDb Rating :: %s (%s votes)\n"
	         (orgmdb-imdb-rating info) (orgmdb-imdb-votes info))
     (format "- Tomatometer :: %s\n" (orgmdb-tomatometer info))
     "\n"
     (format "- Plot :: %s\n" (orgmdb-plot info))
     (let ((last-season nil)
           (episode-strings '()))
       (seq-doseq (episode (alist-get 'Episodes info))
         (let-alist episode
           (let ((curr-season (string-to-number .Season)))
             (setq last-season (if (= curr-season last-season)
				                   last-season curr-season))
             (push (format "%s** [[imdb:%s][%s]]\n- IMDb Rating :: %s\n
- Released :: %s\n"
                           (if (not (= curr-season last-season))
                               (format "* Session %s\n" curr-season) "")
                           .imdbID
                           (orgmdb--episode-to-title episode)
                           .imdbRating
                           .Released)
                   episode-strings))))
       (apply #'concat (reverse episode-strings))))))

(defun orgmdb-insert-media-data/ttybitnik (&rest args)
  "Insert content containing movie info and poster of given ARGS.
  ARGS should be in the same form with `orgmdb' function.

  If this function is called on an org heading then it'll try to
  detect parameters based on that heading.  If not, it'll simply ask
  for title and year."
  (interactive (orgmdb--detect-params-from-header))
  (let ((info (apply #'orgmdb `(,@args :episode all :plot full))))
    (orgmdb--ensure-response-is-successful info)
    (insert (format "\n* %s (%s) - %s\n" (orgmdb-title info)
		            (orgmdb-year info) (orgmdb-imdb-link info)))
    (insert "\n")
    (insert (format "[[file:%s]]\n\n" (orgmdb--download-image-for info)))
    (insert (format "- Genre :: %s\n" (orgmdb-genre info)))
    (insert (format "- Runtime :: %s\n" (orgmdb-runtime info)))
    (insert (format "- Released :: %s\n" (orgmdb-released info)))
    (insert (format "- Rated :: %s\n" (orgmdb-rated info)))
    (insert "\n")
    (insert (format "- Director :: %s\n" (orgmdb-director info)))
    (insert (format "- Writer :: %s\n" (orgmdb-writer info)))
    (insert (format "- Production :: %s\n" (orgmdb-writer info)))
    (insert (format "- Actors :: %s\n" (orgmdb-actors info)))
    (insert "\n")
    (insert (format "- Language :: %s\n" (orgmdb-language info)))
    (insert (format "- Country :: %s\n" (orgmdb-country info)))
    (insert (format "- Awards :: %s\n" (orgmdb-awards info)))
    (insert "\n")
    (insert (format "- Metacritic :: %s\n" (orgmdb-metacritic info)))
    (insert (format "- IMDb Rating :: %s (%s votes)\n"
		            (orgmdb-imdb-rating info) (orgmdb-imdb-votes info)))
    (insert (format "- Tomatometer :: %s\n" (orgmdb-tomatometer info)))
    (insert "\n")
    (insert (format "- Plot :: %s\n" (orgmdb-plot info)))
    (insert "\n")
    (let (last-season)
      (seq-do
       (lambda (episode)
         (let-alist episode
           (let ((curr-season (string-to-number .Season)))
             (insert (format "%s** [[imdb:%s][%s]]\n"
                             (if (and last-season (eq curr-season last-season))
                                 ""
                               (setq last-season curr-season)
                               (format "* Session %s\n" curr-season))
                             .imdbID
                             (orgmdb--episode-to-title episode)))
             (insert (format "- IMDb Rating :: %s\n" .imdbRating))
             (insert (format "- Released :: %s\n" .Released)))))
       (alist-get 'Episodes info)))
    (org-display-inline-images)))

;;* Main:

(setq orgmdb-poster-folder
      (concat orpheusmx-d/ttybitnik (file-name-as-directory "orgmdb")))

;;* Bindings:

;;* Hooks:

;;* Appearance:


(provide 'tty-org-orgmdb)

;;; tty-org-orgmdb.el ends here
