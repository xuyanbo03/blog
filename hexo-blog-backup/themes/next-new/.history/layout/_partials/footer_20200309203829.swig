<script async src="//busuanzi.ibruce.info/busuanzi/2.3/busuanzi.pure.mini.js"></script> 
<div class="copyright">{#
#}{% set current = date(Date.now(), "YYYY") %}{#
#}&copy; {% if theme.footer.since and theme.footer.since != current %}{{ theme.footer.since }} &mdash; {% endif %}{#
#}<span itemprop="copyrightYear">{{ current }}</span>
  <span class="with-love" id="heart">
    <i class="fa fa-{{ theme.footer.icon }} aria-hidden="true"></i>
  </span>
  <span class="author" itemprop="copyrightHolder">{{ theme.footer.copyright || config.author }}</span>

<!--
  {% if theme.post_wordcount.totalcount %}
    <span class="post-meta-divider">|</span>
    <span class="post-meta-item-icon">
      <i class="fa fa-area-chart"></i>
    </span>
    {% if theme.post_wordcount.item_text %}
      <span class="post-meta-item-text">{{ __('post.totalcount') }}&#58;</span>
    {% endif %}
    <span title="{{ __('post.totalcount') }}">{#
    #}{{ totalcount(site, '0,0.0a') }}{#
  #}</span>
  {% endif %}
-->
</div>

<!--
{% if theme.footer.powered %}
  <div class="powered-by">{#
  #}{{ __('footer.powered', '<a class="theme-link" target="_blank" href="https://hexo.io">Hexo</a>') }}{#
#}</div>
{% endif %}

{% if theme.footer.powered and theme.footer.theme.enable %}
  <span class="post-meta-divider">|</span>
{% endif %}

{% if theme.footer.theme.enable %}
  <div class="theme-info">{#
  #}{{ __('footer.theme') }} &mdash; {#
  #}<a class="theme-link" target="_blank" href="https://github.com/iissnan/hexo-theme-next">{#
    #}NexT.{{ theme.scheme }}{#
  #}</a>{% if theme.footer.theme.version %} v{{ theme.version }}{% endif %}{#
#}</div>
{% endif %}
-->

{% if theme.footer.custom_text %}
  <div class="footer-custom">{#
  #}{{ theme.footer.custom_text }}{#
#}</div>
{% endif %}

<div class="theme-info">
  <div class="powered-by"></div>
  <span class="post-count">博客全站共{{ totalcount(site) }}字&nbsp;|&nbsp;</span>
</div>

<div class="powered-by">
<i class="fa fa-user-md"></i><span id="busuanzi_container_site_uv">
  本站访客数:<span id="busuanzi_value_site_uv"></span>人&nbsp;|&nbsp;
</span>
</div>

<div class="powered-by">
<i class="fa fa-user-md"></i><span id="busuanzi_container_site_pv">
    本站总访问量<span id="busuanzi_value_site_pv"></span>次
</span>
</div>

<div class="weixin-box">
  <div class="weixin-menu">
    <div class="weixin-hover">
      <div class="weixin-description">微信扫一扫，订阅本博客</div>
    </div>
  </div>
</div>