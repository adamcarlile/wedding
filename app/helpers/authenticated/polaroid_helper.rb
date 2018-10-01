module Authenticated
  module PolaroidHelper

    def render_polaroid
      image_tag(polaroids.sample, class: 'polaroid', style: "transform: rotate(#{skew}deg)" )
    end

    private

    def skew
      (-10...20).to_a.sample
    end

    def polaroids
      [
        'polaroids/bali-1.png',
        'polaroids/bali-2.png',
        'polaroids/canada-1.png',
        'polaroids/canada-2.png',
        'polaroids/london-1.png',
        'polaroids/london-2.png',
        'polaroids/london-3.png',
        'polaroids/london-4.png',
        'polaroids/london-5.png',
        'polaroids/ni-1.png',
        'polaroids/ni-2.png',
        'polaroids/ni-3.png',
        'polaroids/ni-4.png',
        'polaroids/ni-5.png',
        'polaroids/ni-6.png',
        'polaroids/provence-1.png',
        'polaroids/sa-1.png',
        'polaroids/sa-2.png',
        'polaroids/sa-3.png',
        'polaroids/sa-4.png',
        'polaroids/sa-5.png',
        'polaroids/sa-6.png',
        'polaroids/sa-7.png',
        'polaroids/sa-8.png',
        'polaroids/uk-1.png',
        'polaroids/venice-1.png'
      ]
    end
    
  end
end