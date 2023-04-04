  (define (script-fu-rpgmakermz-charcopy img)
	
    (define drw (car (gimp-image-get-active-layer img)))
   	(define newWidth (car (gimp-image-width img)))
	(define newHeight (car (gimp-image-height img)))

	(gimp-undo-push-group-start img)

    (gimp-image-select-rectangle img 2 1 1 (/ newWidth 3) (/ newHeight 4))
    (gimp-edit-copy drw)
    (gimp-image-select-rectangle img 2 (-(*(/ newWidth 3) 2) 2) 1 (/ newWidth 3) (/ newHeight 4))
    (define floatingLayer (car (gimp-edit-paste drw FALSE)))
    (gimp-item-transform-flip-simple floatingLayer ORIENTATION-HORIZONTAL TRUE 0)
    (gimp-floating-sel-anchor floatingLayer)
    
    (gimp-image-select-rectangle img 2 1 (*(/ newHeight 4) 1) (/ newWidth 3) (/ newHeight 4))
    (gimp-edit-copy drw)
    (gimp-image-select-rectangle img 2 (-(*(/ newWidth 3) 2) 2) (*(/ newHeight 4) 2) (/ newWidth 3) (/ newHeight 4))
    (set! floatingLayer (car (gimp-edit-paste drw FALSE)))
    (gimp-item-transform-flip-simple floatingLayer ORIENTATION-HORIZONTAL TRUE 0)
    (gimp-floating-sel-anchor floatingLayer)
    
    (gimp-image-select-rectangle img 2 (*(/ newWidth 3) 1) (*(/ newHeight 4) 1) (/ newWidth 3) (/ newHeight 4))
    (gimp-edit-copy drw)
    (gimp-image-select-rectangle img 2 (-(*(/ newWidth 3) 1) 2) (*(/ newHeight 4) 2) (/ newWidth 3) (/ newHeight 4))
    (set! floatingLayer (car (gimp-edit-paste drw FALSE)))
    (gimp-item-transform-flip-simple floatingLayer ORIENTATION-HORIZONTAL TRUE 0)
    (gimp-floating-sel-anchor floatingLayer)
    
    (gimp-image-select-rectangle img 2 (*(/ newWidth 3) 2) (*(/ newHeight 4) 1) (/ newWidth 3) (/ newHeight 4))
    (gimp-edit-copy drw)
	(gimp-image-select-rectangle img 2 -1 (*(/ newHeight 4) 2) (/ newWidth 3) (/ newHeight 4))
    (set! floatingLayer (car (gimp-edit-paste drw FALSE)))
    (gimp-item-transform-flip-simple floatingLayer ORIENTATION-HORIZONTAL TRUE 0)
    (gimp-floating-sel-anchor floatingLayer)
    
    (gimp-image-select-rectangle img 2 1 (*(/ newHeight 4) 3) (/ newWidth 3) (/ newHeight 4))
    (gimp-edit-copy drw)
    (gimp-image-select-rectangle img 2 (-(*(/ newWidth 3) 2) 2) (*(/ newHeight 4) 3) (/ newWidth 3) (/ newHeight 4))
    (set! floatingLayer (car (gimp-edit-paste drw FALSE)))
    (gimp-item-transform-flip-simple floatingLayer ORIENTATION-HORIZONTAL TRUE 0)
    (gimp-floating-sel-anchor floatingLayer)
    
   	(gimp-undo-push-group-end img)


  )
  
  (define (script-fu-rpgmakermz-charclear img)
	
    (define drw (car (gimp-image-get-active-layer img)))
	(define newWidth (car (gimp-image-width img)))
	(define newHeight (car (gimp-image-height img)))

	(gimp-undo-push-group-start img)

    (gimp-image-select-rectangle img 2 (*(/ newWidth 3) 2) 1 (/ newWidth 3) (/ newHeight 4))
	(gimp-edit-clear drw)    
    
    (gimp-image-select-rectangle img 2 1 (*(/ newHeight 4) 2) (/ newWidth 3) (/ newHeight 4))
   	(gimp-edit-clear drw)    
    
    (gimp-image-select-rectangle img 2 (*(/ newWidth 3) 1) (*(/ newHeight 4) 2) (/ newWidth 3) (/ newHeight 4))
    (gimp-edit-clear drw)    
    
    (gimp-image-select-rectangle img 2 (*(/ newWidth 3) 2) (*(/ newHeight 4) 2) (/ newWidth 3) (/ newHeight 4))
    (gimp-edit-clear drw)    
    
    (gimp-image-select-rectangle img 2 (*(/ newWidth 3) 2) (*(/ newHeight 4) 3) (/ newWidth 3) (/ newHeight 4))
    (gimp-edit-clear drw)    
    
   	(gimp-undo-push-group-end img)
   	(gimp-edit-clear drw)    


  )
  
	(define (script-fu-rpgmakermz-show-grid-char img)
		(define drw (car (gimp-image-get-active-layer img)))
		(let* (
				(newWidth (car (gimp-image-width img)))
			    (newHeight (car (gimp-image-height img)))
		    )
			(gimp-image-grid-set-spacing img (/ newWidth 12) (/ newHeight 8))			
		)
   )
   
   	(define (script-fu-rpgmakermz-show-grid-charone img)
		(define drw (car (gimp-image-get-active-layer img)))
		(let* (
				(newWidth (car (gimp-image-width img)))
			    (newHeight (car (gimp-image-height img)))
		    )
			(gimp-image-grid-set-spacing img (/ newWidth 3) (/ newHeight 4))
		)
   )
   
   (define (script-fu-rpgmakermz-show-grid-tile img)
		(define drw (car (gimp-image-get-active-layer img)))
		(gimp-image-grid-set-spacing img 48 48)
   )
   
   (define (script-fu-rpgmakermz-show-grid-face img)
		(define drw (car (gimp-image-get-active-layer img)))
		(gimp-image-grid-set-spacing img 144 144)
   )

   
   (define (script-fu-rpgmakermz-show-grid-icons img)
		(define drw (car (gimp-image-get-active-layer img)))
		(gimp-image-grid-set-spacing img 32 32)
   )
  
    (script-fu-register
    "script-fu-rpgmakermz-charclear"                        ;function name
    "Clear Mirror Character parts"                                  ;menu label
    "In 1-character images, clears the character tiles that can be mirrored"              ;description
    "Agustin Bosso"                             ;author
    ""        ;copyright notice
    ""                          ;date created
    ""                                      ;image type that the script works on
    SF-IMAGE       "image"         0   ;image variable
  )
  (script-fu-menu-register "script-fu-rpgmakermz-charclear" "<Image>/Script-Fu/RpgMaker/Character")

  (script-fu-register
    "script-fu-rpgmakermz-charcopy"                        ;function name
    "CopyPaste Mirror Character parts"                                  ;menu label
    "In 1-character images, copies and paste the mirrored tiles"              ;description
    "Agustin Bosso"                             ;author
    ""        ;copyright notice
    ""                          ;date created
    ""                                      ;image type that the script works on
    SF-IMAGE       "image"         0   ;image variable
  )
  (script-fu-menu-register "script-fu-rpgmakermz-charcopy" "<Image>/Script-Fu/RpgMaker/Character")
  
  (script-fu-register
    "script-fu-rpgmakermz-show-grid-char"                        ;function name
    "Show Character 8 grid"                                  ;menu label
    "Shows the grid for an 8-character image map. Dynamically calculates the grid size"              ;description
    "Agustin Bosso"                             ;author
    ""        ;copyright notice
    ""                          ;date created
    ""                                      ;image type that the script works on
    SF-IMAGE       "image"         0   ;image variable
  )
  (script-fu-menu-register "script-fu-rpgmakermz-show-grid-char" "<Image>/Script-Fu/RpgMaker/Grid")
  
    (script-fu-register
    "script-fu-rpgmakermz-show-grid-charone"                        ;function name
    "Show Character 1 grid"                                  ;menu label
    "Shows the grid for a 1-character image map. Dynamically calculates the grid size"              ;description
    "Agustin Bosso"                             ;author
    ""        ;copyright notice
    ""                          ;date created
    ""                                      ;image type that the script works on
    SF-IMAGE       "image"         0   ;image variable
  )
  (script-fu-menu-register "script-fu-rpgmakermz-show-grid-charone" "<Image>/Script-Fu/RpgMaker/Grid")
  
    (script-fu-register
    "script-fu-rpgmakermz-show-grid-tile"                        ;function name
    "Show Tile grid"                                  ;menu label
    "Shows the grid for tileset 48x48 image map."              ;description
    "Agustin Bosso"                             ;author
    ""        ;copyright notice
    ""                          ;date created
    ""                                      ;image type that the script works on
    SF-IMAGE       "image"         0   ;image variable
  )
  (script-fu-menu-register "script-fu-rpgmakermz-show-grid-tile" "<Image>/Script-Fu/RpgMaker/Grid")
  
    (script-fu-register
    "script-fu-rpgmakermz-show-grid-face"                        ;function name
    "Show Face grid"                                  ;menu label
    "Shows the grid for faces 144x144 image map."              ;description
    "Agustin Bosso"                             ;author
    ""        ;copyright notice
    ""                          ;date created
    ""                                      ;image type that the script works on
    SF-IMAGE       "image"         0   ;image variable
  )
  (script-fu-menu-register "script-fu-rpgmakermz-show-grid-face" "<Image>/Script-Fu/RpgMaker/Grid")
  

  
        (script-fu-register
    "script-fu-rpgmakermz-show-grid-icons"                        ;function name
    "Show Icons grid"                                  ;menu label
    "Shows the grid for tileset 32x32 image map."              ;description
    "Agustin Bosso"                             ;author
    ""        ;copyright notice
    ""                          ;date created
    ""                                      ;image type that the script works on
    SF-IMAGE       "image"         0   ;image variable
  )
  (script-fu-menu-register "script-fu-rpgmakermz-show-grid-icons" "<Image>/Script-Fu/RpgMaker/Grid")

