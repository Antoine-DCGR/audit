<?php if (isset($pages) && $pages > 1): ?>
    <div id="pagination" class="pagination">
        <?php if ($page > 1): ?>
            <a href="?controller=accueil&action=<?= e($action) ?>&start=<?= $page - 1 ?><?= e($url ?? '') ?>">
                <img src="./Contenu/img/previous-icon.png" class="icone" alt="Précédent">
            </a>
        <?php endif; ?>

        <?php for ($i = 1; $i <= $pages; $i++): ?>
            <?php if ($page != $i): ?>
                <a class="Start" href="?controller=accueil&action=<?= e($action) ?>&start=<?= $i ?><?= e($url ?? '') ?>"><?= $i ?></a>
            <?php else: ?>
                <a class="active"><?= $i ?></a>
            <?php endif; ?>
        <?php endfor; ?>

        <?php if ($page < $pages): ?>
            <a href="?controller=accueil&action=<?= e($action) ?>&start=<?= $page + 1 ?><?= e($url ?? '') ?>">
                <img src="./Contenu/img/next-icon.png" class="icone" alt="Suivant">
            </a>
        <?php endif; ?>
    </div>
<?php else: ?>
    <div id="pagination" class="hidden"></div>
<?php endif; ?>
