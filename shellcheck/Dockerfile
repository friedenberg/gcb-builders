
FROM busybox

COPY --from=koalaman/shellcheck /bin/shellcheck .
COPY entrypoint.sh .

ENTRYPOINT ["/entrypoint.sh"]
